class Inventory < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_created_at_gte
                with_inventorytype
              ]

  # default for will_paginate
  self.per_page = 10

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(inventories.inventorytype) LIKE ?",
          "LOWER(inventories.datetoreorder) LIKE ?",
          "LOWER(inventories.medicationsrxnormndc) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("inventories.created_at #{ direction }")
    when /^inventorytype_/
      order("LOWER(inventories.inventorytype) #{ direction }")
    when /^medicationsrxnormndc_/
      order("LOWER(inventories.medicationsrxnormndc) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_inventorytype, lambda { |inventory_type|
    where('inventory.inventorytype >= ?', inventory_type)
  }
  scope :with_created_at_gte, lambda { |ref_date|
    where('inventory.created_at >= ?', ref_date)
  }

  def self.options_for_sorted_by
    [
      ['Inventory Type', 'inventorytype_asc'],
      ['Inventory Created', 'created_at_desc'],
      ['Medications Rx Norm NDC', 'medicationsrxnormndc_asc']
    ]
  end
  
  def minstock
    minstock = MedicationsRxNorm.where(ndc: medicationsrxnormndc).pluck(:minstock)
    
    minstock
  end
  
  def medname
    medname = MedicationsRxNorm.where(ndc: medicationsrxnormndc).pluck(:medname)
    
    medname
  end
  
  def generalInventory
    @generalInventory = Inventory.where(:inventorytype => 'General')
    
    @generalInventory
  end
  
  def papInventory
    @papInventory = Inventory.where(:inventorytype => 'PAP')
    
    @papInventory
  end
  
  
  has_many :dispensed_med_inventories
  has_many :dispensed_meds, :through => :dispensed_med_inventories

  has_many :inventory_medications_rx_norms
  has_many :medications_rx_norms, :through => :inventory_medications_rx_norms

  validates_uniqueness_of :invid
  validates_presence_of :invid
  validates :invid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :lotno
  validates_presence_of :currentstock
  validates :currentstock, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :inventorytype
  validates_presence_of :datetoreorder
  validates_presence_of :medicationsrxnormndc
end

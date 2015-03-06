class Patient < ActiveRecord::Base
  
  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_created_at_gte
                with_firstname
                with_lastname
                with_gender
                with_dob
                with_address
                with_city
              ]
              
  self.per_page = 10
  
    scope :search_query, lambda { |query|
    where("firstname LIKE ?", "%#{query}%")
  
    return nil if query.blank?
    
    terms = query.downcase.split(/\s+/)
    
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    
    num_or_conditions = 2
    where(
      terms.map { |term|
          "(LOWER(patients.firstname) LIKE ? OR LOWER(patients.lastname) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }
  
  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("patients.created_at #{ direction }")
    when /^firstname_/
      order("LOWER(patients.firstname) #{ direction }")
    when /^lastname_/
      order("LOWER(patients.lastname) #{ direction }")
    when /^gender_/
      order("patients.gender #{ direction }")
    when /^dob_/
      order("patients.dob #{ direction }")
    when /^address_/
      order("LOWER(patients.address) #{ direction }")
    when /^city_/
      order("LOWER(patients.city) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_created_at_gte, lambda { |ref_date|
    where('patients.created_at >= ?', ref_date)
  }
  scope :with_firstname, lambda { |first_name|
    where('patients.firstname >= ?', first_name)
  }
  scope :with_lastname, lambda { |last_name|
    where('patients.lastname >= ?', last_name)
  }
  scope :with_gender, lambda { |gender|
    where('patients.gender >= ?', gender)
  }
  scope :with_dob, lambda { |dob|
    where('patients.dob >= ?', dob)
  }
  scope :with_address, lambda { |address|
    where('patients.address >= ?', address)
  }
  scope :with_city, lambda { |city|
    where('patients.city >= ?', city)
  }
  
  def self.options_for_sorted_by
    [
      ['First Name', 'firstname_asc'],
      ['Last Name', 'lastname_asc'],
      ['Gender', 'gender_asc'],
      ['Date of Birth', 'dob_asc'],
      ['Address', 'address_asc'],
      ['City', 'city_asc'],
      ['Patient Created', 'created_at_desc']
    ]
  end
  
  def dispensed_meds
    DispensedMed.where(patientsid: ptid).pluck(:inventoryid)
  end
  
  def inventory
    inventory = dispensed_meds()
    
    medicationsrxnormndc = Array.new
    
    inventory.each_index do |index|
      puts inventory[index]
      medicationsrxnormndc.push Inventory.where(invid: inventory[index]).pluck(:medicationsrxnormndc)
    end
    
    medicationsrxnormndc
  end
  
  def medicationsrxnormndc
    medicationsrxnormndc = inventory()
    
    medname = Array.new
    
    medicationsrxnormndc.each_index do|index|
      puts medicationsrxnormndc[index]
      medname.push MedicationsRxNorm.where(ndc: medicationsrxnormndc[index]).pluck(:medname)
    end
    
    medname
  end
    
  
  has_many :dispensed_med_patients
  has_many :dispensed_meds, :through => :dispensed_med_patients
  
  has_many :application_patients
  has_many :applications, :through => :application_patients
  
  has_many :prescription_patients
  has_many :prescriptions, :through => :prescription_patients
  
  validates_uniqueness_of :ptid
  validates :ptid, :numericality => { :greater_than_or_equal_to => 1 }
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :gender
  validates_presence_of :dob
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_length_of :zip, minimum: 5, too_short: '. Please enter at least 5 characters.'
end

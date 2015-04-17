require "rx_nav"
require "open-uri"
require "json"
require "semantics3"

class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :load_activities, only: [:index, :show, :new, :edit, :reorder]
  

  def general
    @activities = PublicActivity::Activity.order("created_at desc")
    
    @filterrific = initialize_filterrific(
      Inventory.where(:inventorytype => 'General'),
      params[:filterrific],
      :select_options => {
        sorted_by: Inventory.options_for_sorted_by
      }
    ) or return
    @inventories = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /inventories
  # GET /inventories.json
  def index
    @activities = PublicActivity::Activity.order("created_at desc")
  #  @inventories = Inventory.all
  #  @reorders = Inventory.find(:all, :conditions => [ "(datetoreorder - Date.today).to_i <= 90", :datetoreorder => params[:datetoreorder] ])
  #  @reorders = Inventory.all(:conditions => ["datetoreorder IN (?)", (params[:datetoreorder] - 90.days)..(params[:datetoreorder])])

    @filterrific = initialize_filterrific(
      Inventory.where(:inventorytype => 'PAP'),
      params[:filterrific],
      :select_options => {
        sorted_by: Inventory.options_for_sorted_by
      }
    ) or return
    @inventories = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
    @inventory.invid = Inventory.maximum(:invid).to_i.next
    @inventory.inventorytype = params[:inventorytype]
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    
    if(@inventory.medicationsrxnormndc.present?)
      medicationsrxnormndc = @inventory.medicationsrxnormndc
      if(!medicationsrxnormndc.include? "-")
        
        puts "This code is running."
        respond_to do |format|
          flash.now[:alert] = "The Medication RxNorm NDC you have entered does not contain any '-'. Please include them."
  
          format.html { render :new }
          format.json { render json: @inventory.errors, status: :unprocessable_entity }
        end
      else
      
        result1 = open("http://rxnav.nlm.nih.gov/REST/rxcui.json?idtype=ndc&id=#{medicationsrxnormndc}").read
        ndcjson = JSON.parse(result1)
        puts "THIS IS THE RXNORM ID: "
        puts ndcjson["idGroup"]["rxnormId"]
        rxnormid = ndcjson["idGroup"]["rxnormId"]
        result2 = open("http://rxnav.nlm.nih.gov/REST/rxcui/#{rxnormid[0]}/properties.json").read
        namejson = JSON.parse(result2)
        puts "THIS IS THE RXNORM NAME: "
        puts namejson["properties"]["name"]
        rxname = namejson["properties"]["name"]
        
        if(!MedicationsRxNorm.exists?(ndc: "#{@inventory.medicationsrxnormndc}") or !MedicationsRxNorm.exists?(ndc: "#{medicationsrxnormndc}"))
          @medications_rx_norm = MedicationsRxNorm.new()
          @medications_rx_norm.medname = rxname
          @medications_rx_norm.ndc = @inventory.medicationsrxnormndc
          @medications_rx_norm.save
        end
        
        if(@inventory.invid.present?)
        else
          @inventory.invid = @inventory.medicationsrxnormndc.delete('-').to_i
        end
        
        respond_to do |format|
          if @inventory.save
            format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
            format.json { render :show, status: :created, location: @inventory }
          else
            format.html { render :new }
            format.json { render json: @inventory.errors, status: :unprocessable_entity }
          end
        end
      end
      
    elsif(@inventory.invid.present?)
      
      sem3 = Semantics3::Products.new('SEM3AF73B740374E5D0F7F156B048135F9BC', 'YTIzZjU3MzEzZGI2ZTYyMWU0NWFlYzI3YTc1NjQwNDQ')
      
      # Build the request
      sem3.products_field( "upc", "#{@inventory.invid}" )
      sem3.products_field( "field", ["name","gtins"] )
      
      # Run the request
      productsHash = sem3.get_products()
      
      # View the results of the request
      puts "THIS IS THE PRODUCT HASH: "
      puts productsHash.to_json
      
      if(JSON.parse(productsHash.to_json)["total_results_count"] != 0)
        rxName = JSON.parse(productsHash.to_json)["results"][0]["name"]
      
        puts "THIS IS THE NAME: "
        puts rxName
        
        rxNameNoSpaces = rxName.gsub(" ", "%20")
        
        result3 = open("http://rxnav.nlm.nih.gov/REST/approximateTerm.json?term=#{rxNameNoSpaces}&maxEntries=4").read
        rxcui = JSON.parse(result3)
        
        if(rxcui["total_results_count"] == 0)
          flash.now[:alert] = "UPC could not be found in our current database. Please enter manually. We are working on expanding our UPC database."
        else
          puts "THIS IS THE RXCUI: "
          puts rxcui
          puts rxcui["approximateGroup"]["candidate"][0]["rxcui"]
          
          result4 = open("http://rxnav.nlm.nih.gov/REST/rxcui/#{rxcui["approximateGroup"]["candidate"][0]["rxcui"]}/ndcs.json").read
          ndcGroup = JSON.parse(result4)
          
          puts "THIS IS THE NDCGROUP: "
          puts ndcGroup
          puts ndcGroup["ndcGroup"]["ndcList"]["ndc"][0]
          
          @inventory.medicationsrxnormndc = ndcGroup["ndcGroup"]["ndcList"]["ndc"][0]
          
          if(!MedicationsRxNorm.exists?(ndc: "#{ndcGroup["ndcGroup"]["ndcList"]["ndc"][0]}"))
            @medications_rx_norm = MedicationsRxNorm.new()
            @medications_rx_norm.medname = rxName
            @medications_rx_norm.ndc = ndcGroup["ndcGroup"]["ndcList"]["ndc"][0]
            @medications_rx_norm.save
          end
        end
        
        respond_to do |format|
          if @inventory.save
            format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
            format.json { render :show, status: :created, location: @inventory }
          else
            format.html { render :new }
            format.json { render json: @inventory.errors, status: :unprocessable_entity }
          end
        end
        
      # Called if UPC lookup returns no results.
      # Will be edited to include an option to enter a drug name.
      else
        respond_to do |format|
          flash.now[:alert] = "UPC information could not be found. We are working on expanding our UPC database. Please enter Medication RxNorm NDC instead."
          format.html { render :new }
          format.json { render json: @inventory.errors, status: :unprocessable_entity }
        end
      end
      
    # Called if neither an inventory ID or Medication RxNorm NDC is entered.
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter either an inventory ID or a Medication RxNorm NDC."

        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:invid, :lotno, :expdate, :currentstock, :inventorytype, :datetoreorder, :medicationsrxnormndc)
    end
    
    def load_activities
      @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
    end
end

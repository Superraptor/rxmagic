require "rx_nav"
require "open-uri"
require "json"

class MedicationsRxNormsController < ApplicationController
  before_action :set_medications_rx_norm, only: [:show, :edit, :update, :destroy]

  include ::RxNav

  # GET /medications_rx_norms
  # GET /medications_rx_norms.json
  def index
    @medications_rx_norms = MedicationsRxNorm.all
  end

  # GET /medications_rx_norms/1
  # GET /medications_rx_norms/1.json
  def show
  end

  # GET /medications_rx_norms/new
  def new
    @medications_rx_norm = MedicationsRxNorm.new
  end

  # GET /medications_rx_norms/1/edit
  def edit
  end

  # POST /medications_rx_norms
  # POST /medications_rx_norms.json
  def create
    
    @medications_rx_norm = MedicationsRxNorm.new(medications_rx_norm_params)
    
    baseURI = "http://rxnav.nlm.nih.gov/REST"
        
    result1 = open("#{baseURI}/rxcui.json?idtype=NDC&id=#{@medications_rx_norm.ndc}").read
    rxcui = JSON.parse(result1)
    
    puts "THIS IS THE RXCUI: "
    puts rxcui
    puts rxcui["idGroup"]["rxnormId"]
    
    
    
    rxNormId = rxcui["idGroup"]["rxnormId"][0].gsub(/\D/, '')
    
    puts "THIS IS THE URL: "
    puts "#{baseURI}/rxcui/#{rxNormId}/ndcs.json"
    
    result2 = open("#{baseURI}/rxcui/#{rxNormId}/properties.json").read
    rxProperties = JSON.parse(result2)
    
    puts "THIS IS THE DRUG NAME: "
    puts rxProperties
    rxName = (rxProperties["properties"]["name"]).gsub(/"/, '')
    
    @medications_rx_norm.medname = rxName
    
    puts "THESE ARE THE NAMES: "
    puts rxName
    puts @medications_rx_norm.medname

    respond_to do |format|
      if @medications_rx_norm.save
        
        
        format.html { redirect_to @medications_rx_norm, notice: 'Medications rx norm was successfully created.' }
        format.json { render :show, status: :created, location: @medications_rx_norm }
        
      else
        format.html { render :new }
        format.json { render json: @medications_rx_norm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medications_rx_norms/1
  # PATCH/PUT /medications_rx_norms/1.json
  def update
    respond_to do |format|
      if @medications_rx_norm.update(medications_rx_norm_params)
        format.html { redirect_to @medications_rx_norm, notice: 'Medications rx norm was successfully updated.' }
        format.json { render :show, status: :ok, location: @medications_rx_norm }
      else
        format.html { render :edit }
        format.json { render json: @medications_rx_norm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications_rx_norms/1
  # DELETE /medications_rx_norms/1.json
  def destroy
    @medications_rx_norm.destroy
    respond_to do |format|
      format.html { redirect_to medications_rx_norms_url, notice: 'Medications rx norm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medications_rx_norm
      @medications_rx_norm = MedicationsRxNorm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medications_rx_norm_params
      params.require(:medications_rx_norm).permit(:ndc, :medname, :minstock, :pharmmanufacturersphid)
    end
end

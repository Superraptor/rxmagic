class DispensedMedsController < ApplicationController
  before_action :set_dispensed_med, only: [:show, :edit, :update, :destroy]

  # GET /dispensed_meds
  # GET /dispensed_meds.json
  def index
    @dispensed_meds = DispensedMed.all
  end

  # GET /dispensed_meds/1
  # GET /dispensed_meds/1.json
  def show
  end

  # GET /dispensed_meds/new
  def new
    @dispensed_med = DispensedMed.new
    
    @dispensed_med.patientsid = params[:ptid]
  end

  # GET /dispensed_meds/1/edit
  def edit
  end

  # POST /dispensed_meds
  # POST /dispensed_meds.json
  def create
    @dispensed_med = DispensedMed.new(dispensed_med_params)
    
    respond_to do |format|
      if @dispensed_med.save
        format.html { redirect_to @dispensed_med, notice: 'Dispensed med was successfully created.' }
        format.json { render :show, status: :created, location: @dispensed_med }
        
        inventoryid = @dispensed_med.inventoryid
        
        puts "THIS IS THE INVENTORY ID: "
        puts inventoryid
        
        # Inventory.find_by(inventoryid).decrement(:currentstock, 1)
        newcurrentstock = Inventory.where(invid: inventoryid).pluck(:currentstock)[0].to_i - 1
        
        puts "THIS IS THE CURRENT STOCK: "
        puts newcurrentstock
        
        @inventory = Inventory.find_by(invid: inventoryid)

        @patient = Patient.find_by(ptid: @dispensed_med.patientsid)

        barcode = "#{@inventory.invid}"
        patientAddress = "#{@patient.address}, #{@patient.city}, #{@patient.state} #{@patient.zip}"
        location = "LOCATION"
        
        @medicationsrxnormndc = MedicationsRxNorm.find_by(ndc: @inventory.medicationsrxnormndc)
        
        if(@inventory.currentstock < 0)
          flash.now[:alert] = 'ERROR: Current stock cannot be negative. Medication not dispensed. Please update inventory and try again.'
          
        elsif(@inventory.currentstock < @medicationsrxnormndc.minstock)
          @inventory.update(currentstock: "#{newcurrentstock}")
          flash.now[:alert] = 'Current stock is now less than minimum stock. Please reorder.'
          @inventory.update(currentstock: "#{newcurrentstock}")
          @dispensed_med.generate_barcode(barcode, @patient.firstname, @patient.lastname, @patient.dob, @patient.gender, patientAddress, location)

        else
          @inventory.update(currentstock: "#{newcurrentstock}")
          @dispensed_med.generate_barcode(barcode, @patient.firstname, @patient.lastname, @patient.dob, @patient.gender, patientAddress, location)

        end

      else
        
        format.html { render :new }
        format.json { render json: @dispensed_med.errors, status: :unprocessable_entity }
      end
    end
  end

  #!/usr/bin/env ruby

  def generate_barcode(barcode, fname, lname, dob, gender, address, location)
  
    result = "\nN\n" +
        "q801\n" + 
        "Q329,026\n" +
        "ZT\n" +
        "B50,185,0,1,4,10,110,N,\"#{barcode}\"\n" +
        "A35,30,0,2,2,2,N,\"#{fname} #{lname}\"\n" +
        "A35,76,0,2,2,2,N,\"#{barcode} #{dob}(#{gender})\"\n" +
        "A35,122,0,2,2,2,N,\"#{address}\"\n" + 
        "A35,168,0,2,2,2,N,\"#{location}\"\n" +
        "P1\n" 
  
    file = File.open("./#{barcode}.lbl", "w")
    
    file.write(result)
    
    file.close
  
  end

  # PATCH/PUT /dispensed_meds/1
  # PATCH/PUT /dispensed_meds/1.json
  def update
    respond_to do |format|
      if @dispensed_med.update(dispensed_med_params)
        format.html { redirect_to @dispensed_med, notice: 'Dispensed med was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispensed_med }
      else
        format.html { render :edit }
        format.json { render json: @dispensed_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispensed_meds/1
  # DELETE /dispensed_meds/1.json
  def destroy
    @dispensed_med.destroy
    respond_to do |format|
      format.html { redirect_to dispensed_meds_url, notice: 'Dispensed med was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispensed_med
      @dispensed_med = DispensedMed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispensed_med_params
      params.require(:dispensed_med).permit(:disdate, :patientsid, :inventoryid)
    end
end

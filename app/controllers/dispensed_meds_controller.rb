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
        
        @inventoryid = params[:inventoryid]
        
        DispensedMeds.find(@inventoryid).inventory.update_attributes(:currentstock => CURRENTSTOCK - 1)

      else
        format.html { render :new }
        format.json { render json: @dispensed_med.errors, status: :unprocessable_entity }
      end
    end
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

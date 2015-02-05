class MedicationsRxNormsController < ApplicationController
  before_action :set_medications_rx_norm, only: [:show, :edit, :update, :destroy]

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
      params.require(:medications_rx_norm).permit(:ndc, :med_name, :min_stock, :pharm_manufacturers_phID)
    end
end

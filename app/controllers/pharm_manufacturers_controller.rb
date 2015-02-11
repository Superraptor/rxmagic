class PharmManufacturersController < ApplicationController
  before_action :set_pharm_manufacturer, only: [:show, :edit, :update, :destroy]

  # GET /pharm_manufacturers
  # GET /pharm_manufacturers.json
  def index
    @pharm_manufacturers = PharmManufacturer.all
  end

  # GET /pharm_manufacturers/1
  # GET /pharm_manufacturers/1.json
  def show
  end

  # GET /pharm_manufacturers/new
  def new
    @pharm_manufacturer = PharmManufacturer.new
  end

  # GET /pharm_manufacturers/1/edit
  def edit
  end

  # POST /pharm_manufacturers
  # POST /pharm_manufacturers.json
  def create
    @pharm_manufacturer = PharmManufacturer.new(pharm_manufacturer_params)

    respond_to do |format|
      if @pharm_manufacturer.save
        format.html { redirect_to @pharm_manufacturer, notice: 'Pharm manufacturer was successfully created.' }
        format.json { render :show, status: :created, location: @pharm_manufacturer }
      else
        format.html { render :new }
        format.json { render json: @pharm_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharm_manufacturers/1
  # PATCH/PUT /pharm_manufacturers/1.json
  def update
    respond_to do |format|
      if @pharm_manufacturer.update(pharm_manufacturer_params)
        format.html { redirect_to @pharm_manufacturer, notice: 'Pharm manufacturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharm_manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @pharm_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharm_manufacturers/1
  # DELETE /pharm_manufacturers/1.json
  def destroy
    @pharm_manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to pharm_manufacturers_url, notice: 'Pharm manufacturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharm_manufacturer
      @pharm_manufacturer = PharmManufacturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharm_manufacturer_params
      params.require(:pharm_manufacturer).permit(:phid, :manufacturer, :minincome, :monthsreorder)
    end
end

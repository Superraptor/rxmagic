class PatientApplicationsController < ApplicationController
  before_action :set_patient_application, only: [:show, :edit, :update, :destroy]

  # GET /patient_applications
  # GET /patient_applications.json
  def index
    @patient_applications = PatientApplication.all
  end

  # GET /patient_applications/1
  # GET /patient_applications/1.json
  def show
  end

  # GET /patient_applications/new
  def new
    @patient_application = PatientApplication.new
  end

  # GET /patient_applications/1/edit
  def edit
  end

  # POST /patient_applications
  # POST /patient_applications.json
  def create
    @patient_application = PatientApplication.new(patient_application_params)

    respond_to do |format|
      if @patient_application.save
        format.html { redirect_to @patient_application, notice: 'Patient application was successfully created.' }
        format.json { render :show, status: :created, location: @patient_application }
      else
        format.html { render :new }
        format.json { render json: @patient_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_applications/1
  # PATCH/PUT /patient_applications/1.json
  def update
    respond_to do |format|
      if @patient_application.update(application_params)
        format.html { redirect_to @patient_application, notice: 'Patient application was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_application }
      else
        format.html { render :edit }
        format.json { render json: @patient_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_applications/1
  # DELETE /patient_applications/1.json
  def destroy
    @patient_application.destroy
    respond_to do |format|
      format.html { redirect_to patient_applications_url, notice: 'Patient application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_application
      @patient_application = PatientApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:patient_application).permit(:patients_ptID, :pharm_manufacturers_phID, :medications_rxnorm_ndc, :app_status, :date_init)
    end
end

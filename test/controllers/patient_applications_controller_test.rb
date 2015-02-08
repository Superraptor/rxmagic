require 'test_helper'

class PatientApplicationsControllerTest < ActionController::TestCase
  setup do
    @patient_application = patient_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_application" do
    assert_difference('PatientApplication.count') do
      post :create, patient_application: { app_status: @patient_application.app_status, date_init: @patient_application.date_init, medications_rxnorm_ndc: @patient_application.medications_rxnorm_ndc, patients_ptID: @patient_application.patients_ptID, pharm_manufacturers_phID: @patient_application.pharm_manufacturers_phID }
    end

    assert_redirected_to patient_application_path(assigns(:patient_application))
  end

  test "should show patient_application" do
    get :show, id: @patient_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_application
    assert_response :success
  end

  test "should update patient_application" do
    patch :update, id: @patient_application, patient_application: { app_status: @patient_application.app_status, date_init: @patient_application.date_init, medications_rxnorm_ndc: @patient_application.medications_rxnorm_ndc, patients_ptID: @patient_application.patients_ptID, pharm_manufacturers_phID: @patient_application.pharm_manufacturers_phID }
    assert_redirected_to patient_application_path(assigns(:patient_application))
  end

  test "should destroy patient_application" do
    assert_difference('PatientApplication.count', -1) do
      delete :destroy, id: @patient_application
    end

    assert_redirected_to patient_applications_path
  end
end

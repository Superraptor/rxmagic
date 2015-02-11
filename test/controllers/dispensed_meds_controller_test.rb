require 'test_helper'

class DispensedMedsControllerTest < ActionController::TestCase
  setup do
    @dispensed_med = dispensed_meds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dispensed_meds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dispensed_med" do
    assert_difference('DispensedMed.count') do
      post :create, dispensed_med: { disdate: @dispensed_med.disdate, inventoryid: @dispensed_med.inventoryid, patientsid: @dispensed_med.patientsid }
    end

    assert_redirected_to dispensed_med_path(assigns(:dispensed_med))
  end

  test "should show dispensed_med" do
    get :show, id: @dispensed_med
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dispensed_med
    assert_response :success
  end

  test "should update dispensed_med" do
    patch :update, id: @dispensed_med, dispensed_med: { disdate: @dispensed_med.disdate, inventoryid: @dispensed_med.inventoryid, patientsid: @dispensed_med.patientsid }
    assert_redirected_to dispensed_med_path(assigns(:dispensed_med))
  end

  test "should destroy dispensed_med" do
    assert_difference('DispensedMed.count', -1) do
      delete :destroy, id: @dispensed_med
    end

    assert_redirected_to dispensed_meds_path
  end
end

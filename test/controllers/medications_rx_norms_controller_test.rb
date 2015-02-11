require 'test_helper'

class MedicationsRxNormsControllerTest < ActionController::TestCase
  setup do
    @medications_rx_norm = medications_rx_norms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medications_rx_norms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medications_rx_norm" do
    assert_difference('MedicationsRxNorm.count') do
      post :create, medications_rx_norm: { medname: @medications_rx_norm.medname, minstock: @medications_rx_norm.minstock, ndc: @medications_rx_norm.ndc, pharmmanufacturersphid: @medications_rx_norm.pharmmanufacturersphid }
    end

    assert_redirected_to medications_rx_norm_path(assigns(:medications_rx_norm))
  end

  test "should show medications_rx_norm" do
    get :show, id: @medications_rx_norm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medications_rx_norm
    assert_response :success
  end

  test "should update medications_rx_norm" do
    patch :update, id: @medications_rx_norm, medications_rx_norm: { medname: @medications_rx_norm.medname, minstock: @medications_rx_norm.minstock, ndc: @medications_rx_norm.ndc, pharmmanufacturersphid: @medications_rx_norm.pharmmanufacturersphid }
    assert_redirected_to medications_rx_norm_path(assigns(:medications_rx_norm))
  end

  test "should destroy medications_rx_norm" do
    assert_difference('MedicationsRxNorm.count', -1) do
      delete :destroy, id: @medications_rx_norm
    end

    assert_redirected_to medications_rx_norms_path
  end
end

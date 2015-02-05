require 'test_helper'

class PharmManufacturersControllerTest < ActionController::TestCase
  setup do
    @pharm_manufacturer = pharm_manufacturers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pharm_manufacturers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pharm_manufacturer" do
    assert_difference('PharmManufacturer.count') do
      post :create, pharm_manufacturer: { manufacturer: @pharm_manufacturer.manufacturer, min_income: @pharm_manufacturer.min_income, months_reorder: @pharm_manufacturer.months_reorder, phID: @pharm_manufacturer.phID }
    end

    assert_redirected_to pharm_manufacturer_path(assigns(:pharm_manufacturer))
  end

  test "should show pharm_manufacturer" do
    get :show, id: @pharm_manufacturer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pharm_manufacturer
    assert_response :success
  end

  test "should update pharm_manufacturer" do
    patch :update, id: @pharm_manufacturer, pharm_manufacturer: { manufacturer: @pharm_manufacturer.manufacturer, min_income: @pharm_manufacturer.min_income, months_reorder: @pharm_manufacturer.months_reorder, phID: @pharm_manufacturer.phID }
    assert_redirected_to pharm_manufacturer_path(assigns(:pharm_manufacturer))
  end

  test "should destroy pharm_manufacturer" do
    assert_difference('PharmManufacturer.count', -1) do
      delete :destroy, id: @pharm_manufacturer
    end

    assert_redirected_to pharm_manufacturers_path
  end
end

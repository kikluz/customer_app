require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do

    # stub create_squareup_customer
    @controller.stubs(:create_squareup_customer).returns(true)

    assert_difference('Customer.count') do
      post :create, customer: { address_line_1: @customer.address_line_1, address_line_2: @customer.address_line_2, country: @customer.country, email_address: @customer.email_address, family_name: @customer.family_name, given_name: @customer.given_name, phone_number: @customer.phone_number, postal_code: @customer.postal_code }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address_line_1: @customer.address_line_1, address_line_2: @customer.address_line_2, country: @customer.country, email_address: @customer.email_address, family_name: @customer.family_name, given_name: @customer.given_name, phone_number: @customer.phone_number, postal_code: @customer.postal_code }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end

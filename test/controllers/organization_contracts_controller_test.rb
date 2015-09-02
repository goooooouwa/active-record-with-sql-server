require 'test_helper'

class OrganizationContractsControllerTest < ActionController::TestCase
  setup do
    @organization_contract = organization_contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organization_contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization_contract" do
    assert_difference('OrganizationContract.count') do
      post :create, organization_contract: { contract_id: @organization_contract.contract_id, created_dt: @organization_contract.created_dt, modified_dt: @organization_contract.modified_dt, organization_id: @organization_contract.organization_id, signed_by_user_id: @organization_contract.signed_by_user_id, signed_dt: @organization_contract.signed_dt }
    end

    assert_redirected_to organization_contract_path(assigns(:organization_contract))
  end

  test "should show organization_contract" do
    get :show, id: @organization_contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization_contract
    assert_response :success
  end

  test "should update organization_contract" do
    patch :update, id: @organization_contract, organization_contract: { contract_id: @organization_contract.contract_id, created_dt: @organization_contract.created_dt, modified_dt: @organization_contract.modified_dt, organization_id: @organization_contract.organization_id, signed_by_user_id: @organization_contract.signed_by_user_id, signed_dt: @organization_contract.signed_dt }
    assert_redirected_to organization_contract_path(assigns(:organization_contract))
  end

  test "should destroy organization_contract" do
    assert_difference('OrganizationContract.count', -1) do
      delete :destroy, id: @organization_contract
    end

    assert_redirected_to organization_contracts_path
  end
end

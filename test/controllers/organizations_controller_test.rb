require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, organization: { account_type_id: @organization.account_type_id, created_by_user_id: @organization.created_by_user_id, created_dt: @organization.created_dt, modified_by_user_id: @organization.modified_by_user_id, modified_dt: @organization.modified_dt, org_id: @organization.org_id, org_src_id: @organization.org_src_id, target_marketer_billing_user_id: @organization.target_marketer_billing_user_id, target_marketer_bit: @organization.target_marketer_bit, target_marketer_subscription_pricing_id: @organization.target_marketer_subscription_pricing_id }
    end

    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, id: @organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization
    assert_response :success
  end

  test "should update organization" do
    patch :update, id: @organization, organization: { account_type_id: @organization.account_type_id, created_by_user_id: @organization.created_by_user_id, created_dt: @organization.created_dt, modified_by_user_id: @organization.modified_by_user_id, modified_dt: @organization.modified_dt, org_id: @organization.org_id, org_src_id: @organization.org_src_id, target_marketer_billing_user_id: @organization.target_marketer_billing_user_id, target_marketer_bit: @organization.target_marketer_bit, target_marketer_subscription_pricing_id: @organization.target_marketer_subscription_pricing_id }
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_redirected_to organizations_path
  end
end

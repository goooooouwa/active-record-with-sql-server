require 'test_helper'

class EventFacebookPagesControllerTest < ActionController::TestCase
  setup do
    @event_facebook_page = event_facebook_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_facebook_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_facebook_page" do
    assert_difference('EventFacebookPage.count') do
      post :create, event_facebook_page: { created_dt: @event_facebook_page.created_dt, evnt_id: @event_facebook_page.evnt_id, facebook_page_id: @event_facebook_page.facebook_page_id }
    end

    assert_redirected_to event_facebook_page_path(assigns(:event_facebook_page))
  end

  test "should show event_facebook_page" do
    get :show, id: @event_facebook_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_facebook_page
    assert_response :success
  end

  test "should update event_facebook_page" do
    patch :update, id: @event_facebook_page, event_facebook_page: { created_dt: @event_facebook_page.created_dt, evnt_id: @event_facebook_page.evnt_id, facebook_page_id: @event_facebook_page.facebook_page_id }
    assert_redirected_to event_facebook_page_path(assigns(:event_facebook_page))
  end

  test "should destroy event_facebook_page" do
    assert_difference('EventFacebookPage.count', -1) do
      delete :destroy, id: @event_facebook_page
    end

    assert_redirected_to event_facebook_pages_path
  end
end

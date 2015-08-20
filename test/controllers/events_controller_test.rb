require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { created_by_user_id: @event.created_by_user_id, created_dt: @event.created_dt, lnk_evnt_id: @event.lnk_evnt_id, lnk_evnt_status_id: @event.lnk_evnt_status_id, modified_by_user_id: @event.modified_by_user_id, modified_dt: @event.modified_dt, org_id: @event.org_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { created_by_user_id: @event.created_by_user_id, created_dt: @event.created_dt, lnk_evnt_id: @event.lnk_evnt_id, lnk_evnt_status_id: @event.lnk_evnt_status_id, modified_by_user_id: @event.modified_by_user_id, modified_dt: @event.modified_dt, org_id: @event.org_id }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
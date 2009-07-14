require 'test_helper'

class LearnerSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learner_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learner_session" do
    assert_difference('LearnerSession.count') do
      post :create, :learner_session => { }
    end

    assert_redirected_to learner_session_path(assigns(:learner_session))
  end

  test "should show learner_session" do
    get :show, :id => learner_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => learner_sessions(:one).to_param
    assert_response :success
  end

  test "should update learner_session" do
    put :update, :id => learner_sessions(:one).to_param, :learner_session => { }
    assert_redirected_to learner_session_path(assigns(:learner_session))
  end

  test "should destroy learner_session" do
    assert_difference('LearnerSession.count', -1) do
      delete :destroy, :id => learner_sessions(:one).to_param
    end

    assert_redirected_to learner_sessions_path
  end
end

require 'test_helper'

class LearnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learner" do
    assert_difference('Learner.count') do
      post :create, :learner => { }
    end

    assert_redirected_to learner_path(assigns(:learner))
  end

  test "should show learner" do
    get :show, :id => learners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => learners(:one).to_param
    assert_response :success
  end

  test "should update learner" do
    put :update, :id => learners(:one).to_param, :learner => { }
    assert_redirected_to learner_path(assigns(:learner))
  end

  test "should destroy learner" do
    assert_difference('Learner.count', -1) do
      delete :destroy, :id => learners(:one).to_param
    end

    assert_redirected_to learners_path
  end
end

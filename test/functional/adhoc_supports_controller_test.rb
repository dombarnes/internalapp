require 'test_helper'

class AdhocSupportsControllerTest < ActionController::TestCase
  setup do
    @adhoc_support = adhoc_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adhoc_supports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adhoc_support" do
    assert_difference('AdhocSupport.count') do
      post :create, :adhoc_support => @adhoc_support.attributes
    end

    assert_redirected_to adhoc_support_path(assigns(:adhoc_support))
  end

  test "should show adhoc_support" do
    get :show, :id => @adhoc_support.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @adhoc_support.to_param
    assert_response :success
  end

  test "should update adhoc_support" do
    put :update, :id => @adhoc_support.to_param, :adhoc_support => @adhoc_support.attributes
    assert_redirected_to adhoc_support_path(assigns(:adhoc_support))
  end

  test "should destroy adhoc_support" do
    assert_difference('AdhocSupport.count', -1) do
      delete :destroy, :id => @adhoc_support.to_param
    end

    assert_redirected_to adhoc_supports_path
  end
end

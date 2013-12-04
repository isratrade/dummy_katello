require 'test_helper'

module Katello
  class ActivationKeysControllerTest < ActionController::TestCase
    setup do
      @activation_key = activation_keys(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:activation_keys)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create activation_key" do
      assert_difference('ActivationKey.count') do
        post :create, activation_key: { name: @activation_key.name }
      end
  
      assert_redirected_to activation_key_path(assigns(:activation_key))
    end
  
    test "should show activation_key" do
      get :show, id: @activation_key
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @activation_key
      assert_response :success
    end
  
    test "should update activation_key" do
      put :update, id: @activation_key, activation_key: { name: @activation_key.name }
      assert_redirected_to activation_key_path(assigns(:activation_key))
    end
  
    test "should destroy activation_key" do
      assert_difference('ActivationKey.count', -1) do
        delete :destroy, id: @activation_key
      end
  
      assert_redirected_to activation_keys_path
    end
  end
end

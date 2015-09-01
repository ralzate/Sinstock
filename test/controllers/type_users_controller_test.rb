require 'test_helper'

class TypeUsersControllerTest < ActionController::TestCase
  setup do
    @type_user = type_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_user" do
    assert_difference('TypeUser.count') do
      post :create, type_user: { description: @type_user.description, name: @type_user.name }
    end

    assert_redirected_to type_user_path(assigns(:type_user))
  end

  test "should show type_user" do
    get :show, id: @type_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_user
    assert_response :success
  end

  test "should update type_user" do
    patch :update, id: @type_user, type_user: { description: @type_user.description, name: @type_user.name }
    assert_redirected_to type_user_path(assigns(:type_user))
  end

  test "should destroy type_user" do
    assert_difference('TypeUser.count', -1) do
      delete :destroy, id: @type_user
    end

    assert_redirected_to type_users_path
  end
end

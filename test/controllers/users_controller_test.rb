require 'test_helper'

class UsersControllerTest < ActionController::TestCase

    
  include Sorcery::TestHelpers::Rails::Controller


  def setup
    @user = users(:raul)
  end

  test "should get index" do
    login_user(user = @user, route = login_url)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create , user: {name: @user.name, email: "lala@user.email", password: 'secret', password_confirmation: 'secret' }
      #user: { crypted_password: @user.crypted_password, email: @user.email, name: @user.name, salt: @user.salt }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    login_user(user = @user, route = login_url)
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    login_user(user = @user, route = login_url)
    get :edit, id: @user
    #assert_redirected_to edit_user_path(@user)
    assert_response :success
  end

  test "should update user" do
    login_user(user = @user, route = login_url)
    patch :update, id: @user, user: {name: @user.name, email: @user.email, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    login_user(user = @user, route = login_url)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end

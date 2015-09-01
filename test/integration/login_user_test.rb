require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest



  def setup
    @user = users(:raul)
  end
  test "log in with valid info followed by log out" do
    get login_path
    post sessions_url, email: @user.email, password: 'secret'
    assert is_logged_in?
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to login_url
  end

  test "log in with invalid info" do
    get login_path
    post sessions_url, email: "blablabla@dsd.com", password: 'sdsecret'
    assert_not is_logged_in?
    assert_template 'sessions/new'
  end

  test "log in with Remember Me" do
    get login_path
    post sessions_url, email: @user.email, password: 'secret', remember_me: '1'
    assert_not_nil cookies["remember_me_token"]
  end
  
end

require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  def setup

  end

  test "user sign up with valid info" do
    get signup_path
    assert_difference 'User.count' do
    post_via_redirect users_path, user: { name: "blasdasd",
                                          email: "lala@user.email",
                                          password: 'secret',
                                          password_confirmation: 'secret' }
    end
    assert_template 'users/show'
  end

  test "user sign up with invalid info" do
    get signup_path
    assert_no_difference 'User.count' do
    post_via_redirect users_path, user: { name: "bld",
                                          email: "lala@user.email",
                                          password: 'scret',
                                          password_confirmation: 'secret' }
    end
    assert_template 'users/new'
  end
end

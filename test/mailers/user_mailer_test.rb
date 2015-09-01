require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  setup do
    @user = User.create(name: "Lalauser", email: "lala@user.email", password: 'secret', password_confirmation: 'secret' )
  end

  test "activation_needed_email" do
    mail = UserMailer.activation_needed_email(@user)
    assert_equal "Account activation", mail.subject
    assert_equal ["lala@user.email"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Welcome", mail.body.encoded
  end

  test "activation_success_email" do
    mail = UserMailer.activation_success_email(@user)
    assert_equal "Your account is now activated", mail.subject
    assert_equal ["lala@user.email"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Congratulations", mail.body.encoded
  end

end

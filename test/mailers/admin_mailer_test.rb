require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "new_vessel" do
    mail = AdminMailer.new_vessel
    assert_equal "New vessel", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "edit_vessel" do
    mail = AdminMailer.edit_vessel
    assert_equal "Edit vessel", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

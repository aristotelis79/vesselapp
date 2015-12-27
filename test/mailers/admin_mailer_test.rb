require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  def setup
    @vessel = vessels(:one)
  end
  
  test "new_vessel" do
    mail = AdminMailer.new_vessel("localhost", @vessel)
    assert_equal "A vessel was created", mail.subject
    assert_equal ["aristotelis79@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "localhost", mail.body.encoded
    assert_match "#{@vessel.title}", mail.body.encoded
    assert_match "#{@vessel.description}", mail.body.encoded
    assert_match "#{@vessel.daily_price}", mail.body.encoded
  end

  test "edit_vessel" do
    vessel_before = vessels(:two)
    mail = AdminMailer.edit_vessel("localhost", @vessel, vessel_before)
    assert_equal "A vessel was updated", mail.subject
    assert_equal ["aristotelis79@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "localhost", mail.body.encoded
    assert_match "#{@vessel.title}", mail.body.encoded
    assert_match "#{@vessel.description}", mail.body.encoded
    assert_match "#{@vessel.daily_price}", mail.body.encoded
    assert_match "#{vessel_before.title}", mail.body.encoded
    assert_match "#{vessel_before.description}", mail.body.encoded
    assert_match "#{vessel_before.daily_price}", mail.body.encoded
  end

end

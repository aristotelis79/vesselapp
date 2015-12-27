class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_vessel.subject
  #
  def new_vessel(ip,vessel)
    @ip = ip
    @vessel = vessel
    mail to: "aristotelis79@gmail.com" , subject: 'A vessel was created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.edit_vessel.subject
  #
  def edit_vessel(ip, vessel, vessel_before)
    @ip = ip
    @vessel = vessel
    @vessel_before = vessel_before
    mail to: "aristotelis79@gmail.com", subject: 'A vessel was updated'
  end
end

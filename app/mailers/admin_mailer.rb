class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_vessel.subject
  #
  def new_vessel
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.edit_vessel.subject
  #
  def edit_vessel
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

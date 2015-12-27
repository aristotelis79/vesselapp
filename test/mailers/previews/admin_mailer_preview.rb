# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/new_vessel
  def new_vessel
    AdminMailer.new_vessel
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/edit_vessel
  def edit_vessel
    AdminMailer.edit_vessel
  end

end

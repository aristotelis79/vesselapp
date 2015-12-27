# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/new_vessel
  def new_vessel
      ip = 'localhost'
      vessel = Vessel.first
    AdminMailer.new_vessel(ip, vessel)
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/edit_vessel
  def edit_vessel
      ip = 'localhost'
      vessel = Vessel.first
      vessel_changes = Vessel.second
    AdminMailer.edit_vessel(ip, vessel, vessel_changes)
  end

end

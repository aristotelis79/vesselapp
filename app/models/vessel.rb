class Vessel < ActiveRecord::Base
  validates :title, :description, :daily_price, :fee_pc, :presence => true
  validates :daily_price, :fee_pc, :numericality => true
  after_initialize :init

  def init
    self.fee_pc  ||= 20 #Standar fee
  end
end

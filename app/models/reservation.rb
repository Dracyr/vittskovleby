class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :location, presence: true
end

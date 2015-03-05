class Location < ActiveRecord::Base
  validates :name, presence: true

  has_many :reservations, through: :location_reservations
  has_many :location_reservations, dependent: :destroy
end

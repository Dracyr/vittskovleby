class Location < ApplicationRecord
  has_many :reservations, through: :location_reservations
  has_many :location_reservations, dependent: :destroy

  validates :name, presence: true
end

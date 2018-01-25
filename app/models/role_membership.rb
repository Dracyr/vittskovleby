class RoleMembership < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :role, presence: true
  validates :user, presence: true
end

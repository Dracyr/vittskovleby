class RoleMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates :role, presence: true
  validates :user, presence: true
end

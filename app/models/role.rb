class Role < ActiveRecord::Base
  has_many :role_memberships
  has_many :users, through: :role_memberships

  validates :role_name, presence: true

  def to_s
    I18n.t "activerecord.attributes.role.#{role_name}"
  end
end

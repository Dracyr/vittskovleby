class User < ActiveRecord::Base
  has_many :role_memberships
  has_many :roles, through: :role_memberships

  scope :with_role, -> (role_name) { joins(:roles).where(roles: {role_name: role_name})}

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  def admin?
    role?('admin')
  end

  def role?(role_name)
    roles.pluck(:role_name).include?(role_name)
  end
end

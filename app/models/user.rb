class User < ActiveRecord::Base
  validates :role, presence: true

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  enum role: [:user, :admin, :super_admin]

  def self.admin_emails
    admin.pluck(:email)
  end
end

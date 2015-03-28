class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  validates :role, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  enum role: [:user, :admin]
end

class User < ActiveRecord::Base
  validates :role, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]
end

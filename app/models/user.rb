class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  validates :role, presence: true

  enum role: [:user, :admin]
end

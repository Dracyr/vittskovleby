class Menu < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :pages
end

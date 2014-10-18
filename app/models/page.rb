class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, presence: true

end

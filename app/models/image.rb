class Image < ApplicationRecord
  extend Dragonfly::Model

  dragonfly_accessor :file
end

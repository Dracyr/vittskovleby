module CacheKey
  extend ActiveSupport::Concern

  module ClassMethods
    def cache_key
      unscoped.pluck("COUNT(*)", "MAX(updated_at)").flatten.map(&:to_i).join("-")
    end
  end
end

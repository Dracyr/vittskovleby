module CacheHelper
  def cache_key_homepage
    ['v1', Event.cache_key, EditableField.cache_key].flatten
  end
end

module CacheHelper
  def cache_key_for_navbar
    path = request.original_fullpath
    [Menu.cache_key, path.gsub('/', '_'), (current_user.roles || 'guest')]
  end

  def cache_key_homepage
    ['v1', cache_key_for_navbar, Event.cache_key, EditableField.cache_key].flatten
  end
end

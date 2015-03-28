module CacheHelper
  def cache_key_for_navbar
    path = request.original_fullpath
    [Menu.cache_key, path.gsub('/', '_'), (current_user.try(:role) || 'guest')]
  end

  def cache_key_homepage
    [cache_key_for_navbar, Event.cache_key, EditableField.cache_key].flatten
  end
end
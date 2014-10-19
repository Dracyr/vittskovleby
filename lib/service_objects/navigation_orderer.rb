class NavigationOrderer
  def initialize(param)
    @data = JSON.parse(param)
  end

  def update
    @data.each_with_index do |parent_element|
      parent = Page.find(parent_element['id'])

      #Since this is an orphan, set parent to nil
      parent.parent = nil

      #Set each sucessive page to botton, so that the first ends up on top
      parent.move_to_bottom

      parent.save

      if parent_element['children']
        parent_element['children'].each_with_index do |child_element|
          child = Page.find(child_element['id'])

          child.parent = parent
          child.move_to_bottom

          child.save
        end
      end
    end
  end
end

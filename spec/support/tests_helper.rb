module TestsHelper
  def find_parent(argument)
    find(argument).find(:xpath,".//..")
  end
end

crumb :root do
  link "Home", root_path
end

crumb :pages do
  link "Pages", pages_path
end

crumb :page do |page|
  link page.title, pages_path(page)
  parent :pages
end

crumb :new_page do |page|
  link "New page"
  parent :pages
end

crumb :edit_page do |page|
  link "Edit #{page.title}"
  parent :page, page
end

crumb :new_menu do |menu|
  link "New menu"
  parent :pages
end

crumb :edit_menu do |menu|
  link "Edit menu #{menu.title}"
  parent :pages
end

crumb :posts do
  link "Posts", posts_path
end

crumb :post do |post|
  link post.title, posts_path(post)
  parent :posts
end

crumb :new_post do |post|
  link "New post"
  parent :posts
end

crumb :edit_post do |post|
  link "Edit #{post.title}"
  parent :post, post
end

crumb :images do
  link "Images", images_path
end

crumb :new_image do |image|
  link "Upload image"
  parent :images
end

crumb :edit_image do |image|
  link "Edit #{image.title}"
  parent :image, image
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
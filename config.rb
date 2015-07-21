set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :livereload
activate :directory_indexes

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

activate :blog do |blog|
  blog.prefix = "blog"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

data.links['entries'].each do |link|
  proxy "/links/#{link.title.parameterize}.html", "/links/index.html", :locals => { :link => link }, :ignore => true
end

helpers do
  def questions_path
    "/questions"
  end
end

# build configs
configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets
end


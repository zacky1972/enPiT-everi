require 'slim'

activate :relative_assets

set :slim, {
  pretty: true,
  sort_attrs: false
}

###
# Page options, layouts, aliases and proxies
###

activate :external_pipeline,
  name: :gulp_post,
  command: "yarn gulp build", 
  source: "build",
  latency: 1



# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  activate :iepab,
	name: :gulp_post,
  	command: "yarn gulp post", 
  	source: "build",
  	latency: 1
end

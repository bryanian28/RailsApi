source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rack-cors', :require => 'rack/cors'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# gem 'sqlite3'

gem 'puma', '~> 3.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# add this code then bundle install

gem 'mysql2', '~> 0.3.18'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

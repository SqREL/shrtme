source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activerecord', '~> 5.0.2'
gem 'actionpack', '~> 5.0.2'
gem 'actionview', '~> 5.0.2'
gem 'activejob', '~> 5.0.2'
gem 'activesupport', '~> 5.0.2'
gem 'railties', '~> 5.0.2'
gem 'sprockets-rails', '~> 3.2.0'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

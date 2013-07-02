require 'bundler'
Bundler.require(:default, ENV['RACK_EN'] || :development)

db_config = YAML::load(File.open(File.expand_path('~/configs/app_name/database.yml')))[(ENV['RACK_ENV'] || :development).to_s]
ActiveRecord::Base.establish_connection(db_config)

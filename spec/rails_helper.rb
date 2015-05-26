# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

Fg ||= FactoryGirl

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.include Sorcery::TestHelpers::Rails::Controller, type: :controller
  config.include Sorcery::TestHelpers::Rails::Integration, type: :feature

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end

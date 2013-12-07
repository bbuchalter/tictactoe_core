require_relative 'support/setup_load_paths'
require_relative 'support/object_creation_methods'
require_relative 'support/shared_assertions'

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  require 'json'
  SimpleCov.start do
    minimum_coverage 100
    add_filter '/test/'
  end
end

require 'coveralls'
Coveralls.wear! if Coveralls.will_run?

require 'minitest/autorun'

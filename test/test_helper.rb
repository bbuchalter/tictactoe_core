require_relative 'support/setup_load_paths'
require_relative 'support/object_creation_methods'
require_relative 'support/shared_assertions'

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  require 'json'
  SimpleCov.start do
    minimum_coverage 100
    add_filter "/test/"
  end
end

require 'coveralls'
if Coveralls.will_run?
  Coveralls.wear!
end

require 'minitest/autorun'
require_relative 'support/setup_load_paths'
require_relative 'support/object_creation_methods'
require_relative 'support/shared_assertions'

require 'coveralls'
if Coveralls.will_run?
  Coveralls.wear!
end

require 'minitest/autorun'
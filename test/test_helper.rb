require_relative 'support/setup_load_paths'

require 'coveralls'
if Coveralls.will_run?
  Coveralls.wear!
end

require 'minitest/autorun'
#Generate test coverage report
require 'simplecov'
SimpleCov.coverage_dir(File.join('tmp', 'coverage'))
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActionController
module Flash
class FlashNow
def initialize
@flash = {}
@now_cache = {}
@flash[@now_cache] = {}
end

def []=(k, v)
@now_cache = k
@flash[@now_cache]= v
v
end
end

class FlashHash
def now_cache
self || {}
end
end
end
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


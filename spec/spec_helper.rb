$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capistrano-influx'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

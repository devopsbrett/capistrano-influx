require 'capistrano/spec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.include Capistrano::Spec::Helpers
  config.include Capistrano::Spec::Matchers
end

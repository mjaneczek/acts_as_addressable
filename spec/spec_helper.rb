require 'support/coverage'
require 'bundler/setup'

Bundler.setup
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|

end
require 'bundler/setup'
Bundler.setup

require 'acts_as_addressable'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|

end

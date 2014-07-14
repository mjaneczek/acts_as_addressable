require 'rspec/core'
require 'generator_spec/generator_example_group'

RSpec::configure do |c|
  c.include GeneratorSpec::GeneratorExampleGroup
end

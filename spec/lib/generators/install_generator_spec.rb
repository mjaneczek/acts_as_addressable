require 'generator_spec'
require_relative '../../../lib/generators/acts_as_addressable/install_generator'

describe ActsAsAddressable::Generators::InstallGenerator do
  destination File.expand_path('../../../../tmp', __FILE__)
  arguments %w(address_attribute)

  before(:all) do
    prepare_destination
    run_generator
  end

  it 'creates a model and migration' do
    assert_file 'app/models/address.rb'
    assert_migration 'db/migrate/create_addresses.rb', /t.string :address_attribute/
  end
end

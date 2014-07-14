require 'rails/generators/migration'

module ActsAsAddressable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      argument :fields, type: :array, default: [:street, :city, :state]

      def self.next_migration_number(path)
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def create_model_file
        template 'address.rb', 'app/models/address.rb'
        migration_template 'create_addresses.rb', 'db/migrate/create_addresses.rb'
      end
    end
  end
end

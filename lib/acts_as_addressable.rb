Dir["#{File.dirname(__FILE__)}/acts_as_addressable/**/*.rb"].each { |file| require file }

require 'active_record'
ActiveRecord::Base.send(:include, ActsAsAddressable::Addressable)

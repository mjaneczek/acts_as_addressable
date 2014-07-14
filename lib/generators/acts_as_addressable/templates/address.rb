class Address < ActiveRecord::Base
  acts_as_addressable
  belongs_to :addressable, polymorphic: true
end

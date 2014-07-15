require 'active_record'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

ActiveRecord::Schema.define(version: 0) do
  create_table :company, force: true do |t|
    t.string :name
  end

  create_table :addresses, force: true do |t|
    t.string   :line_1
    t.string   :line_2
    t.integer  :addressable_id
    t.string   :addressable_type

    t.datetime :created_at
    t.datetime :updated_at
  end
end

class Company < ActiveRecord::Base
  acts_as_addressable
end

class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
end

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

<% fields.each do |field| -%>
      t.string :<%= field %>
<% end -%>
      t.references :addressable, polymorphic: true
      t.string :type

      t.timestamps
    end

    add_index :addresses, [:addressable_id, :addressable_type]
  end
end

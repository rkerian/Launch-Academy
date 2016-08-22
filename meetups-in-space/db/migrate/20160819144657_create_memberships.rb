class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |table|
      table.integer :meetup_id, null: false
      table.integer :user_id, nill: false

      table.timestamps
    end
  end
end

class CreateAttendance < ActiveRecord::Migration
  def change
    create_table :attendance do |table|
      table.integer :event_id, null: false
      table.integer :user_id, null: false
      table.boolean :rsvp, null: false

      table.timestamps
    end
  end
end

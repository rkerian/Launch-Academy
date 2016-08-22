class AssociateForeignKeysInAttendance < ActiveRecord::Migration
  def change
    add_foreign_key :attendance, :events, column: :event_id
    add_foreign_key :attendance, :users, column: :user_id
  end
end

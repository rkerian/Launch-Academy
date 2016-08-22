class AssociateForeignKeysInComments < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :events, column: :event_id
    add_foreign_key :comments, :users, column: :user_id
  end
end

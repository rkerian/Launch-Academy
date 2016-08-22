class AssociateForeignKeysInMemberships < ActiveRecord::Migration
  def change
    add_foreign_key :memberships, :meetups, column: :meetup_id
    add_foreign_key :memberships, :users, column: :user_id
  end
end

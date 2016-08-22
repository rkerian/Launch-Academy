class AssociateMeetupsCreatorWithUseridForeignKey < ActiveRecord::Migration
  def change
    remove_column :meetups, :creator
    add_column :meetups, :creator, :integer
    add_foreign_key :meetups, :users, column: :creator
  end
end

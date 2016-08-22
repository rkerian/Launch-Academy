class AddLocationAndCreatorToMeetups < ActiveRecord::Migration
  def change
    change_table :meetups do |table|
      table.string :location, null: false
      table.string :creator, null: false
    end
  end
end

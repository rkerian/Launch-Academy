class CreateMeetup < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.text :description, null: false

      table.timestamps
    end
  end
end

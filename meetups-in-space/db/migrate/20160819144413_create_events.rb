class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |table|
      table.string :title, null: false
      table.text :description, null: false
      table.string :location, null: false

      table.timestamps
    end
  end
end

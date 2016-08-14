class CreateFortunes < ActiveRecord::Migration[5.0]
  def change
    create_table :fortunes do |t|
      t.string :content, null: false
      t.timestamp :created_at, null: false
    end
  end
end

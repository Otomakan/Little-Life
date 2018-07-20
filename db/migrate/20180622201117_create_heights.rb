class CreateHeights < ActiveRecord::Migration[5.2]
  def change
    create_table :heights do |t|
      t.integer :height
      t.date :day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateDailyIntakes < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_intakes do |t|
      t.text :calories
      t.date :day
      t.references :user, foreign_key: true

      t.timestamps
    end
    # add_index :daily_intakes, [:user_id]
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :blood_type
      t.string :diet_type
      t.string :gender

      t.timestamps
    end
  end
end

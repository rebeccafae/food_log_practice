class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :meal
      t.time :time_of_meal
      t.text :food

      t.timestamps null: false
    end
  end
end

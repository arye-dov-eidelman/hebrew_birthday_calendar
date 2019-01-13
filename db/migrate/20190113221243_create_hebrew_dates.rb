class CreateHebrewDates < ActiveRecord::Migration[5.2]
  def change
    create_table :hebrew_dates do |t|
      t.integer :day
      t.integer :month
      t.boolean :is_adar_b

      t.timestamps
    end
  end
end

class CreateCalendarUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_users do |t|
      t.integer :user_id
      t.integer :calendar_id
      t.string :access_level

      t.timestamps
    end
  end
end

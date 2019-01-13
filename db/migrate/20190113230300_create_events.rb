class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.integer :calendar_id
      t.integer :hebrew_date_id

      t.timestamps
    end
  end
end

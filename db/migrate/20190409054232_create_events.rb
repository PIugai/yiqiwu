class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.integer :capacity
      t.integer :spots_filled
      t.text :description
      t.time :start_time
      t.time :end_time
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :photo

      t.timestamps
    end
  end
end

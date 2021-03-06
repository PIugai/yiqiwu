class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :wechat_id
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

class AddIconToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :icon_path, :string
  end
end

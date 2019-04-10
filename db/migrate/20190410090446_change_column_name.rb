class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :icon_path, :iconPath
  end
end

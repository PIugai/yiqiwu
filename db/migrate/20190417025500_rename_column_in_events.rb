class RenameColumnInEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :iconPath, :iconPathYellow
    rename_column :events, :iconPathSelect, :iconPathRed
  end
end

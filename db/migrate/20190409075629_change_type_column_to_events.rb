class ChangeTypeColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :type, :activity_type
  end
end

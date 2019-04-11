class RemoveTimeColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :start_time
    remove_column :events, :end_time
  end
end

class AddIconPathSelectToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :iconPathSelect, :string
  end
end

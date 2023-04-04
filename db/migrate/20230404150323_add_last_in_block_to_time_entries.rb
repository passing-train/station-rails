class AddLastInBlockToTimeEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :time_entries, :last_in_block, :boolean
    add_column :time_entries, :not_in_export, :boolean
    add_column :time_entries, :sticky, :boolean
    add_column :time_entries, :time_delta, :integer
    add_column :time_entries, :extra_time, :integer
  end
end

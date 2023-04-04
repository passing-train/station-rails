class RemoveRefsInTimeEntries < ActiveRecord::Migration[7.0]
  def change
    remove_column :time_entries, :project
  end
end

class RemoveIndexInTimeEntries < ActiveRecord::Migration[7.0]
  def change
    remove_index :time_entries, name: "index_time_entries_on_project_id"
  end
end

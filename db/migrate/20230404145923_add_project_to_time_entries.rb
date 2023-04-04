class AddProjectToTimeEntries < ActiveRecord::Migration[7.0]
  def change
    add_reference :time_entries, :project, null: false, foreign_key: true
  end
end

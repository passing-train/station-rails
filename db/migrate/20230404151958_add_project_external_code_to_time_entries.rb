class AddProjectExternalCodeToTimeEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :time_entries, :project_external_code, :string
  end
end

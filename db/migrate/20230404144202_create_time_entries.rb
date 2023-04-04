class CreateTimeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :time_entries do |t|
      t.string :entry_text
      t.string :project_external_code
      t.boolean :last_in_block
      t.boolean :not_in_export
      t.boolean :sticky
      t.integer :time_delta
      t.integer :extra_time

      t.timestamps
    end
  end
end

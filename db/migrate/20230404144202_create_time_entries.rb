class CreateTimeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :time_entries do |t|
      t.string :entry_text

      t.timestamps
    end
  end
end

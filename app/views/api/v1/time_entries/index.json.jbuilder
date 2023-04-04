json.time_entries @time_entries do |time_entry|
  json.id time_entry.id
  json.entry_text time_entry.entry_text
  json.created_at time_entry.created_at
end

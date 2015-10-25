json.array!(@managed_files) do |managed_file|
  json.extract! managed_file, :id, :managed_file_name, :managed_file_uri, :managed_file_mime, :managed_file_size, :managed_file_status, :managed_file_timestamp, :managed_file_time_to_leave, :managed_file_deleted, :managed_file_parent_id, :managed_file_user_id, :managed_file_user_type
  json.url managed_file_url(managed_file, format: :json)
end

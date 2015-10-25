class CreateManagedFiles < ActiveRecord::Migration
  def change
    create_table :managed_files do |t|
      t.string :managed_file_name
      t.string :managed_file_uri
      t.string :managed_file_mime
      t.integer :managed_file_size
      t.integer :managed_file_status
      t.integer :managed_file_timestamp
      t.integer :managed_file_time_to_leave
      t.integer :managed_file_deleted
      t.integer :managed_file_parent_id
      t.integer :managed_file_user_id
      t.integer :managed_file_user_type

      t.timestamps null: false
    end
  end
end

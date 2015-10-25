class AddManagedFileObjectToManagedFile < ActiveRecord::Migration
  def change
    add_column :managed_files, :managed_file_object, :binary, limit: 1.megabyte
  end
end

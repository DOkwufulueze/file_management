class CreateManagedFilesUsages < ActiveRecord::Migration
  def change
    create_table :managed_files_usages do |t|
      t.references :managed_file, index: true, foreign_key: true
      t.string :model
      t.integer :model_id
      t.integer :count

      t.timestamps null: false
    end
  end
end

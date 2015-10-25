class ManagedFile < ActiveRecord::Base
  # validates :file_field, presence: true
  
  def file_object=(file_field)
    self.managed_file_object = file_field.read
    self.managed_file_name = base_part_of(file_field.original_filename)
    self.managed_file_mime = file_field.content_type.chomp
    self.managed_file_uri = file_field.path
    self.managed_file_size = file_field.size
    self.managed_file_status = 0
    self.managed_file_timestamp = Time.now.to_i
    # self.managed_file_time_to_leave = 5.hours.from_now.to_i
    self.managed_file_time_to_leave = 10.seconds.from_now.to_i
    self.managed_file_deleted = 0
    self.managed_file_parent_id = ((ManagedFile.last.try(:id)) || 0) + 1
    self.managed_file_user_id = 2
    self.managed_file_user_type = 2
  end

  def base_part_of file_name
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end

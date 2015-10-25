class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :clear_expired_managed_files
  

  def clear_expired_managed_files
    expired_files = ManagedFile.where("managed_file_time_to_leave <= #{Time.now.to_i} AND managed_file_status = 0")
    if expired_files.length > 0
      expired_files.each do |expired_file|
        if expired_file.id = session[:file_id]
          session[:deleted] = 1
        end
        expired_file.destroy
      end
    end
  end
end

class ManagedFilesUsagesController < ApplicationController
  before_action :set_managed_file, only: [:models]

  def usage
    @managed_files_usage = ManagedFilesUsage.all
  end

  def models
    @models = ManagedFilesUsage.where("managed_file_id = #{@managed_file.id}")
  end

  private
    def set_managed_file
      @managed_file = ManagedFile.find(params[:id])
    end
end

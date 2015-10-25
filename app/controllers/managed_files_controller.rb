class ManagedFilesController < ApplicationController
  before_action :set_managed_file, only: [:show, :edit, :update, :destroy, :uploaded_file]

  # GET /managed_files
  # GET /managed_files.json
  def index
    @managed_files = ManagedFile.all
  end

  # GET /managed_files/1
  # GET /managed_files/1.json
  def show
  end

  # GET /managed_files/new
  def new
    @managed_file = ManagedFile.new
  end

  # GET /managed_files/1/edit
  def edit
  end

  # POST /managed_files
  # POST /managed_files.json
  def create
    @managed_file = ManagedFile.new(file_object: managed_file_params[:file_object])
    respond_to do |format|
      if @managed_file.save
        format.html { redirect_to managed_files_path, notice: "File successfully uploaded." }
        # format.json { render :show, status: :created, location: @managed_file }
        # format.json { render text: ":::File #{@managed_file} successfully uploaded." }
        format.js {
          session[:file_id] = @managed_file.id
          @message = ":::File #{@managed_file.managed_file_name} successfully uploaded. Click submit below to complete upload."
        }
      else
        format.html { render :new }
        format.json { render json: @managed_file.errors, status: :unprocessable_entity }
        format.js {
          @message = ":::Unable to upload file for now."
        }
      end
    end
  end

  # PATCH/PUT /managed_files/1
  # PATCH/PUT /managed_files/1.json
  def update
    respond_to do |format|
      if @managed_file.update(managed_file_params)
        format.html { redirect_to @managed_file, notice: 'Managed file was successfully updated.' }
        format.json { render :show, status: :ok, location: @managed_file }
      else
        format.html { render :edit }
        format.json { render json: @managed_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managed_files/1
  # DELETE /managed_files/1.json
  def destroy
    ManagedFilesUsage.destroy_all("managed_file_id = #{@managed_file.id}")
    @managed_file.destroy
    session[:file_id] = nil
    respond_to do |format|
      format.html { redirect_to managed_files_url, notice: 'Managed file was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def write_to_usage
    id = session[:file_id]
    unless id
      redirect_to managed_files_new_url, notice: ":::No File Chosen for saving."       
    else
      if session[:deleted] == 1
        redirect_to managed_files_new_url, notice: ":::Your session has expired. Please select a file again"
        session[:deleted] = nil
      else
        @managed_file = ManagedFile.find(id)
        @managed_file.update(managed_file_status: 1)
        model_id = (ManagedFilesUsage.last.try(:id) || 0) + 1
        if (ManagedFilesUsage.find_by(managed_file_id: id))
          @managed_files_usage = ManagedFilesUsage.find_by(managed_file_id: id)
          count = @managed_files_usage.count + 1
          @managed_files_usage.update(count: count)
          session[:file_id] = nil
          respond_to do |format|
            format.html { redirect_to managed_files_new_url, notice: ":::File Usage successfully Saved." }
            format.json { }
            format.js { }
          end
        else
          @managed_files_usage = ManagedFilesUsage.new(managed_file_id: session[:file_id], model: "Deal", model_id: model_id, count: 1)
          respond_to do |format|
            if @managed_files_usage.save
              session[:file_id] = nil
              format.html { redirect_to managed_files_new_url, notice: ":::File Usage successfully Saved." }
              format.json { }
              format.js { }
            else
              format.html { redirect_to managed_files_new_url, notice: ":::Save Unsuccessful..." }
              format.json { }
              format.js { }
            end
          end
        end
      end
    end
  end

  def uploaded_file
    send_data(@managed_file.managed_file_object,
    filename: @managed_file.managed_file_name,
    type: @managed_file.managed_file_mime,
    disposition: "inline")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managed_file
      @managed_file = ManagedFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def managed_file_params
      # params.require(:managed_file).permit(:managed_file)
      params[:managed_file]
    end
end

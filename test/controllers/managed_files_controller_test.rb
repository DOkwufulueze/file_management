require 'test_helper'

class ManagedFilesControllerTest < ActionController::TestCase
  setup do
    @managed_file = managed_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:managed_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create managed_file" do
    assert_difference('ManagedFile.count') do
      post :create, managed_file: { managed_file_deleted: @managed_file.managed_file_deleted, managed_file_mime: @managed_file.managed_file_mime, managed_file_name: @managed_file.managed_file_name, managed_file_parent_id: @managed_file.managed_file_parent_id, managed_file_size: @managed_file.managed_file_size, managed_file_status: @managed_file.managed_file_status, managed_file_time_to_leave: @managed_file.managed_file_time_to_leave, managed_file_timestamp: @managed_file.managed_file_timestamp, managed_file_uri: @managed_file.managed_file_uri, managed_file_user_id: @managed_file.managed_file_user_id, managed_file_user_type: @managed_file.managed_file_user_type }
    end

    assert_redirected_to managed_file_path(assigns(:managed_file))
  end

  test "should show managed_file" do
    get :show, id: @managed_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @managed_file
    assert_response :success
  end

  test "should update managed_file" do
    patch :update, id: @managed_file, managed_file: { managed_file_deleted: @managed_file.managed_file_deleted, managed_file_mime: @managed_file.managed_file_mime, managed_file_name: @managed_file.managed_file_name, managed_file_parent_id: @managed_file.managed_file_parent_id, managed_file_size: @managed_file.managed_file_size, managed_file_status: @managed_file.managed_file_status, managed_file_time_to_leave: @managed_file.managed_file_time_to_leave, managed_file_timestamp: @managed_file.managed_file_timestamp, managed_file_uri: @managed_file.managed_file_uri, managed_file_user_id: @managed_file.managed_file_user_id, managed_file_user_type: @managed_file.managed_file_user_type }
    assert_redirected_to managed_file_path(assigns(:managed_file))
  end

  test "should destroy managed_file" do
    assert_difference('ManagedFile.count', -1) do
      delete :destroy, id: @managed_file
    end

    assert_redirected_to managed_files_path
  end
end

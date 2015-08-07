require 'test_helper'

class PictureFramesControllerTest < ActionController::TestCase
  setup do
    @picture_frame = picture_frames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:picture_frames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picture_frame" do
    assert_difference('PictureFrame.count') do
      post :create, picture_frame: { image_url: @picture_frame.image_url, name: @picture_frame.name }
    end

    assert_redirected_to picture_frame_path(assigns(:picture_frame))
  end

  test "should show picture_frame" do
    get :show, id: @picture_frame
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picture_frame
    assert_response :success
  end

  test "should update picture_frame" do
    patch :update, id: @picture_frame, picture_frame: { image_url: @picture_frame.image_url, name: @picture_frame.name }
    assert_redirected_to picture_frame_path(assigns(:picture_frame))
  end

  test "should destroy picture_frame" do
    assert_difference('PictureFrame.count', -1) do
      delete :destroy, id: @picture_frame
    end

    assert_redirected_to picture_frames_path
  end
end

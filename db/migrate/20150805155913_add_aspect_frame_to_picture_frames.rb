class AddAspectFrameToPictureFrames < ActiveRecord::Migration
  def change
    add_column :picture_frames, :aspect_frame, :string
    add_column :picture_frames, :top, :integer
    add_column :picture_frames, :left, :integer
  end
end

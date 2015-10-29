class AddImageMetaToPictureFrames < ActiveRecord::Migration
  def change
  	add_column :picture_frames, :image_meta, :text
  end
end

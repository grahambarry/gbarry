class AddAttachmentImageToPictureFrames < ActiveRecord::Migration
  def self.up
    change_table :picture_frames do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :picture_frames, :image
  end
end

class CreatePictureFrames < ActiveRecord::Migration
  def change
    create_table :picture_frames do |t|
      t.string :name
      t.string :image_url

      t.timestamps null: false
    end
  end
end

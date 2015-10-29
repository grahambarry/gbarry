json.array!(@picture_frames) do |picture_frame|
  json.extract! picture_frame, :id, :name, :image_url
  json.url picture_frame_url(picture_frame, format: :json)
end

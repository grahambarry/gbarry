json.array!(@pins) do |pin|
  json.extract! pin, :id, :name, :image_url
  json.url pin_url(pin, format: :json)
end
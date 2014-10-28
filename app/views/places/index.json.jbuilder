json.array!(@places) do |place|
  json.extract! place, :id, :name, :address, :lat, :lng
  json.url place_url(place, format: :json)
end

json.array!(@bikes) do |bike|
  json.extract! bike, :id, :lock_password, :name
  json.url bike_url(bike, format: :json)
end

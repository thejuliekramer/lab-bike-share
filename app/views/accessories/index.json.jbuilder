json.array!(@accessories) do |accessory|
  json.extract! accessory, :id, :type, :not_missing
  json.url accessory_url(accessory, format: :json)
end

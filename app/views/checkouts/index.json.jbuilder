json.array!(@checkouts) do |checkout|
  json.extract! checkout, :id, :user_id, :bike_id, :returned_at
  json.url checkout_url(checkout, format: :json)
end

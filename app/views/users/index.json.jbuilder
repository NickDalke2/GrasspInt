json.array!(@users) do |user|
  json.extract! user, :id, :name, :money, :address
  json.url user_url(user, format: :json)
end

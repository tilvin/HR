json.array!(@users) do |user|
  json.extract! user, :id, :name, :salary, :contact, :status, :role
  json.url user_url(user, format: :json)
end

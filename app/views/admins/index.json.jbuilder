json.array!(@admins) do |admin|
  json.extract! admin, :id, :name, :username, :password_hash, :password_salt, :persistence_token
  json.url admin_url(admin, format: :json)
end

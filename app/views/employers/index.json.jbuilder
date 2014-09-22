json.array!(@employers) do |employer|
  json.extract! employer, :id, :company, :contact, :email, :password_hash, :password_salt
  json.url employer_url(employer, format: :json)
end

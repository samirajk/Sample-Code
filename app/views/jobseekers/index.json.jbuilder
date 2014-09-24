json.array!(@jobseekers) do |jobseeker|
  json.extract! jobseeker, :id, :name, :email, :password_hash, :password_salt, :phonenumber, :skills, :resume
  json.url jobseeker_url(jobseeker, format: :json)
end

json.array!(@jobtags) do |jobtag|
  json.extract! jobtag, :id, :job_id, :tag_id
  json.url jobtag_url(jobtag, format: :json)
end

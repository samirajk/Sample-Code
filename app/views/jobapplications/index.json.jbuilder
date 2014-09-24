json.array!(@jobapplications) do |jobapplication|
  json.extract! jobapplication, :id, :coverletter, :dateofapplication, :status
  json.url jobapplication_url(jobapplication, format: :json)
end

json.array!(@job_applications) do |job_application|
  json.extract! job_application, :id, :coverletter, :date_of_application, :status
  json.url job_application_url(job_application, format: :json)
end

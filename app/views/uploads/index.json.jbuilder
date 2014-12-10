json.array!(@uploads) do |upload|
  json.extract! upload, :id, :file
  json.url upload_url(upload, format: :json)
end

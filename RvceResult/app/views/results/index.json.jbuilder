json.array!(@results) do |result|
  json.extract! result, :id, :usn, :department, :branch, :sem, :year
  json.url result_url(result, format: :json)
end

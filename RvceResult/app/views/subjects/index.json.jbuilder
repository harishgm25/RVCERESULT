json.array!(@subjects) do |subject|
  json.extract! subject, :id, :sem, :branch, :scode, :sname
  json.url subject_url(subject, format: :json)
end

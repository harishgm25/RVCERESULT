json.array!(@sems) do |sem|
  json.extract! sem, :id, :sname, :year
  json.url sem_url(sem, format: :json)
end

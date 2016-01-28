json.array!(@incidents) do |incident|
  json.extract! incident, :id, :title, :state, :summary, :happened_at, :resolved_at, :meta
  json.url incident_url(incident, format: :json)
end

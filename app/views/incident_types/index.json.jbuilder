json.array!(@incident_types) do |incident_type|
  json.extract! incident_type, :id, :name, :description
  json.url incident_type_url(incident_type, format: :json)
end

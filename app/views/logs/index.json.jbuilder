json.array!(@logs) do |log|
  json.extract! log, :id, :meal, :time_of_meal, :food
  json.url log_url(log, format: :json)
end

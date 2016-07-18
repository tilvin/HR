json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :id, :name, :period, :salary, :contact
  json.url vacancy_url(vacancy, format: :json)
end

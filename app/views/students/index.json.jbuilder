json.array!(@students) do |student|
  json.extract! student, :email, :name
  json.url student_url(student, format: :json)
end

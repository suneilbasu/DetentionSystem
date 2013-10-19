json.array!(@teachers) do |teacher|
  json.extract! teacher, :name, :email, :group
  json.url teacher_url(teacher, format: :json)
end

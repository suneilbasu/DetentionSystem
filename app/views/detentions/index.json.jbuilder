json.array!(@detentions) do |detention|
  json.extract! detention, :teacher_id, :student_id, :date, :time, :reason, :points, :parent_detention, :status, :additional_notes
  json.url detention_url(detention, format: :json)
end

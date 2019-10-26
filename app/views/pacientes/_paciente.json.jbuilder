json.extract! paciente, :id, :name, :last_name, :curso, :photo, :birth_date, :role, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)

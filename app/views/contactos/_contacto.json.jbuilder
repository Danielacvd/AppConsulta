json.extract! contacto, :id, :nombre, :apellido, :correo, :mensaje, :created_at, :updated_at
json.url contacto_url(contacto, format: :json)

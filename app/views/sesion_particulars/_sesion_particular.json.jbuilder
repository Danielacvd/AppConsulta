json.extract! sesion_particular, :id, :cita, :descripcion_sesion, :numero_cita, :created_at, :updated_at
json.url sesion_particular_url(sesion_particular, format: :json)

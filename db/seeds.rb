# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#
Cargo.create(name: "administrador")
User.create(name: "admin", email: "admin@admin.com", cargo_id: 1, password: "asdasdasd", role: 1)
# User.create(name: "userVisita2", email: "v2@gmail.com", cargo_id: 2, password: "asdasdasd")
# User.create(name: "userVisita3", email: "v3@gmail.com", cargo_id: 2, password: "asdasdasd")
# 10.times do |i|
#   Cargo.create(name: "Cargo#{i + 1}")
# end



#Para subir fotos por consola
#el archivo tiene que estar en la raiz del directorio
#Para ingresar fotos.
# 10.times do
#   Photo.create(image: File.open('gato.jpg'))
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

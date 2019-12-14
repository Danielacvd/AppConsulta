# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", email: "admin@admin.com", password: "asdasdasd", role: 1)
User.create(name: "userVisita2", email: "v2@gmail.com", password: "asdasdasd")
User.create(name: "userVisita3", email: "v3@gmail.com", password: "asdasdasd")

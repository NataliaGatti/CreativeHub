# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require "open-uri"

Project.destroy_all
# Application.destroy_all
User.destroy_all

puts "Creando tres users"
natalia = User.create!(email: "gattinati.ng@gmail.com", password: "gattinati", name: "Amazon Ws", company: true)
facundo = User.create!(email: "facundolanus@gmail.com", password: "facundolanus", name: "Facundo", company: false)
camilo = User.create!(email: "camilogzlez@gmail.com", password: "camilogzlez", name: "Fratelli Branca e Comp.", company: true )

puts "Creando Projects"

 amazon = Project.create!(
  title: "Sesion de fotografia de productos en almacen", 
  description: "Se solicita sesion fotografica de los productos que tenemos en stock en almacen un total de 10 fotos", 
  cost: 320,
  deadline: Date.new(2021, 2, 14, 18), 
  status: 0, 
  user: natalia
)

 branca = Project.create!(
  title: "Creacion de nuevo logo para edicion limitada de Fernet", 
  description: "Se solicita la creacion de un nuevo logo para lanzamiento de edicion limitada de fernet Strong", 
  cost: 1200,
  deadline: Date.new(2021, 3, 14, 18),
  status: 0, 
  user: camilo
)


puts "Seeds creadas"
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

Category.destroy_all

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

puts "Creando cinco categories"

diseno_photo = URI.open('https://images.pexels.com/photos/1762851/pexels-photo-1762851.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
diseno_grafico = Category.create(title: 'Diseño Grafico')
diseno_grafico.photo.attach(io: diseno_photo, filename: 'diseno.png', content_type: 'image/png')

photography_photo = URI.open('https://images.unsplash.com/photo-1523467327888-a8a445992901?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHBob3RvZ3JhcGh5fGVufDB8fDB8&auto=format&fit=crop&w=500&q=60')
photography = Category.create(title: 'Fotografía')
photography.photo.attach(io: photography_photo, filename: 'fotografia.png', content_type: 'image/png')

video_photo = URI.open('https://images.unsplash.com/photo-1493804714600-6edb1cd93080?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
video = Category.create(title: 'Video')
video.photo.attach(io: video_photo, filename: 'video.png', content_type: 'image/png')

illustration_photo = URI.open('https://images.unsplash.com/photo-1569309338532-a0c01062acc8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHwxMzQ2ODg4Mnx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
illustration = Category.create(title: 'Ilustración')
illustration.photo.attach(io: illustration_photo, filename: 'ilustration.png', content_type: 'image/png')

ux_design_photo = URI.open('https://images.pexels.com/photos/196645/pexels-photo-196645.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
uxdesign = Category.create(title: 'Diseño UX/UI Responsive')
uxdesign.photo.attach(io: ux_design_photo, filename: 'uxdesign.png', content_type: 'image/png')

puts "Creando dos relaciones project-category"
CategoryProject.create( project: amazon, category: photography )

CategoryProject.create( project: branca, category: diseno_grafico )

puts "Seeds creadas"

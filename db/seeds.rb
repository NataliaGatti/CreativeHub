# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require "open-uri"

Review.destroy_all
CategoryProject.destroy_all
Project.destroy_all
User.destroy_all
Category.destroy_all


puts "Creando los users"
nico = User.create!(email: "nicokennedy@lewagon.com", password: "nicokennedy", name: "Nico", company: false, rating: 5)
nico.photo.attach(io: open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_600,w_600/jjnpprepy6ktoh1afgdz.jpg"), filename: "nicolas.png", content_type: "image/jpeg")
nico.save!
natalia = User.create!(email: "nataliagatti@gmail.com", password: "gattinati", name: "Natalia", company: false, rating: 5)
natalia.photo.attach(io: open("https://media-exp1.licdn.com/dms/image/C4E03AQFRmz1UnrvuIg/profile-displayphoto-shrink_200_200/0/1543620258222?e=1617235200&v=beta&t=1QeHZ_iybNlZxuwzfFYFpvWdILj5Seu4tLh7e0Rcz-s"), filename: "natalia.png", content_type: "image/jpeg")
natalia.save!
amazon = User.create!(email: "info@amazon.com", password: "amazon", name: "Amazon Ws", company: true, rating: 5)
amazon.photo.attach(io: open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEMIOmeq9LtpU4GjRhGAJc8w59muy6vN_Nwg&usqp=CAU"), filename: "amazon.png", content_type: "image/jpeg")
amazon.save!
facundo = User.create!(email: "facundolanus1@gmail.com", password: "facundolanus", name: "Facundo", company: false, rating: 5)
facundo.photo.attach(io: open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1607801912/qslheonjcmvqvi19xvhn.jpg"), filename: "facundo.png", content_type: "image/jpeg")
facundo.save!
camilo = User.create!(email: "camilogzlez1@gmail.com", password: "camilogzlez", name: "Camilo", company: false, rating: 5)
camilo.photo.attach(io: open("https://avatars.githubusercontent.com/u/28843593?v=4"), filename: "camilo.png", content_type: "image/jpeg")
camilo.save!
branca = User.create!(email: "info@branca.com", password: "branca", name: "Fratelli Branca e Comp.", company: true, rating: 4)
branca.photo.attach(io: open("https://pbs.twimg.com/profile_images/1290415520060018688/oYoZsmHe_400x400.jpg"), filename: "branca.png", content_type: "image/jpeg")
branca.save!
pwc = User.create!(email: "info@pwc.com", password: "pwcargentina", name: "Price Waterhouse Company", company: true, rating: 3)
pwc.photo.attach(io: open("https://media-exp1.licdn.com/dms/image/C4D0BAQFvBQ2SqWWHSw/company-logo_200_200/0/1593606103058?e=2159024400&v=beta&t=MpgmUCejhY2zbk2NYhPY7jP262BMp1A8zyCiB5kjcJQ"), filename: "pwc.png", content_type: "image/jpeg")
pwc.save!
telecom = User.create!(email: "info@telecom.com", password: "telecom", name: "Telecom Argentina SA", company: true, rating: 3)
telecom.photo.attach(io: open("https://i2.wp.com/unaaldia.hispasec.com/wp-content/uploads/2020/07/Telecom.png?fit=1200%2C608&ssl=1"), filename: "telecom.png", content_type: "image/jpeg")
telecom.save!
arcor = User.create!(email: "info@arcor.com", password: "arcorargentina", name: "ARCOR Argentina SA", company: true, rating: 5)
arcor.photo.attach(io: open("https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Arcor_logo.svg/1200px-Arcor_logo.svg.png"), filename: "arcor.png", content_type: "image/jpeg")
arcor.save!
correo_argentino = User.create!(email: "info@correoargentino.com", password: "correoargentino", name: "Correo Argentino", company: true, rating: 2)
correo_argentino.photo.attach(io: open("https://radiobellavista.com/wp-content/uploads/2020/05/correo-714x400-1.jpg"), filename: "correo_argentino.png", content_type: "image/jpeg")
correo_argentino.save!
cuareim = User.create!(email: "info@cuareimviajes.com", password: "cuareimviajes", name: "Cuareim Viajes y Turismo", company: true, rating: 4)
cuareim.photo.attach(io: open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaE4Q_AIQWXxHp9hH-HjE9mTnr4FBBbG2FhA&usqp=CAU"), filename: "cuareim.png", content_type: "image/jpeg")
cuareim.save!
valti = User.create!(email: "info@valti.com", password: "valtiargentina", name: "VALTI Seguridad Industrial", company: true, rating: 5)
valti.photo.attach(io: open("https://i.pinimg.com/236x/81/d9/e0/81d9e071f746a047f2fa1c16069dcfd1.jpg"), filename: "valti.png", content_type: "image/jpeg")
valti.save!
vega = User.create!(email: "info@vega.com", password: "vegaargentina", name: "De La Vega M&A", company: true, rating: 4)
vega.photo.attach(io: open("https://www.delavegamya.com.ar/wp-content/uploads/2020/11/logo-200.png"), filename: "vega.png", content_type: "image/jpeg")
vega.save!
cocacola = User.create!(email: "info@cocacola.com", password: "cocacola", name: "Coca Cola Company", company: true, rating: 5)
cocacola.photo.attach(io: open("https://i.pinimg.com/originals/fe/14/1e/fe141e8c0978a1cf5f38ddffec420c98.jpg"), filename: "cocacola.png", content_type: "image/jpeg")
cocacola.save!
chevallier = User.create!(email: "info@chevallier.com", password: "chevallier", name: "Chevallier Transportes", company: true, rating: 3)
chevallier.photo.attach(io: open("https://www.centraldepasajes.com.ar/empresas-de-micro/img/logos/chevallier-logo.png"), filename: "chevallier.png", content_type: "image/jpeg")
chevallier.save!
loreal = User.create!(email: "info@loreal.com", password: "lorealargentina", name: "L'oreal Argentina", company: true, rating: 5)
loreal.photo.attach(io: open("https://logos-marcas.com/wp-content/uploads/2020/04/LOreal-Emblema.jpg"), filename: "loreal.png", content_type: "image/jpeg")
loreal.save!

puts "Creando Projects"

 branca_photo = Project.create!(
  title: "Sesión de fotografía de productos en almacén", 
  description: "Se solicita sesión fotográfica de los productos que tenemos en stock en almacén un total de 10 fotos", 
  cost: 320,
  deadline: Date.new(2021, 4, 14, 18), 
  status: "Abierto", 
  user: branca
)

 branca_logo = Project.create!(
  title: "Creación de nuevo logo para edición limitada de Fernet", 
  description: "Se solicita la creación de un nuevo logo para lanzamiento de edición limitada de fernet Strong", 
  cost: 1200,
  deadline: Date.new(2021, 3, 16, 12),
  status: "Abierto", 
  user: branca
)

 pwc_software = Project.create!(
  title: "Creación de software online a medida", 
  description: "Se solicita la creación de una aplicación de gestión contable para la operación con bancos.", 
  cost: 1500,
  deadline: Date.new(2021, 5, 20, 20),
  status: "Abierto", 
  user: pwc
)

 cuareim_3d = Project.create!(
  title: "Videógrafo 3d para redes sociales", 
  description: "Se necesita un profesional que cree videos con algunas animaciones 3d agregando la identidad de imagen acorde a la marca.", 
  cost: 230,
  deadline: Date.new(2021, 4, 3, 20),
  status: "Abierto", 
  user: cuareim
)

 pwc_video = Project.create!(
  title: "Creación de Videos", 
  description: "Creación de videos cortos 15 segundos para stories de instagram, yo paso el material, pero no tengo los efectos. Estoy buscando transiciones muy rápidas que comuniquen un mensaje a corto tiempo.", 
  cost: 120,
  deadline: Date.new(2021, 5, 3, 20),
  status: "Abierto", 
  user: pwc
)

 correo_argentino = Project.create!(
  title: "Desarrollador Php para relevamiento de entregas", 
  description: "Se solicita la creación de un sistema de control de las entregas y rechazos usando lenguaje Php.", 
  cost: 1420,
  deadline: Date.new(2021, 4, 23, 20),
  status: "Abierto", 
  user: correo_argentino
)

 cuareim_redes = Project.create!(
  title: "Creador de contenido y manejo de redes sociales", 
  description: "Se solicita una persona que pueda planificar, crear contenido y ejecutar en las plataformas instagram y linkedin.
  La empresa ya tiene manual de marca.", 
  cost: 250,
  deadline: Date.new(2021, 4, 13, 20),
  status: "Abierto", 
  user: cuareim
)

 branca_web = Project.create!(
  title: "Optimización web", 
  description: "Se solicita mejora en el tiempo de carga del sitio web que coore por WordPress de contactos , preferentemente evitando el uso de plugins.", 
  cost: 100,
  deadline: Date.new(2021, 5, 8, 20),
  status: "Abierto", 
  user: branca
)

 pwc_web = Project.create!(
  title: "Análisis completo de un sitio web para mejoras Seo", 
  description: "Se necesita analizar un sitio web que lleva 20 años y que requiere tener un mejor posicionamiento con respecto al momento, revisar bien para dar propuestas de mejoras.", 
  cost: 1500,
  deadline: Date.new(2021, 3, 28, 20),
  status: "Abierto", 
  user: pwc
)

 cuareim_facebook = Project.create!(
  title: "Especialista en Facebook Ads", 
  description: "Definición, Gestión y Optimización de campañas en Facebook Ads.
  Creación, gestión e implantación en Facebook Ads orientados a generar ventas y leads cualificados.", 
  cost: 500,
  deadline: Date.new(2021, 4, 8, 20),
  status: "Abierto", 
  user: cuareim
)

 pwc_md = Project.create!(
  title: "Coordinador Marketing Digital", 
  description: "Se solicita coordinador de área, quien será responsable de la creación de estrategias digitales y de contenido.", 
  cost: 450,
  deadline: Date.new(2021, 3, 18, 20),
  status: "Abierto", 
  user: pwc
)

 loreal = Project.create!(
  title: "Estrategia de campaña para email marketing", 
  description: "Se solicita el apoyo para el envió de contenido ya creado, a los que hay que agregar diseño de email (html y css) junto a la creación de algunos gráficos.", 
  cost: 1000,
  deadline: Date.new(2021, 3, 18, 20),
  status: "Abierto", 
  user: loreal
)

 branca_video = Project.create!(
  title: "Video campaña de marketing", 
  description: "Se solicita video para renovar campaña de marketing 2021.", 
  cost: 800,
  deadline: Date.new(2021, 3, 13, 12),
  status: "Cerrado", 
  user: branca
)

 branca_flyer = Project.create!(
  title: "Flyer para lanzamiento nueva temporada", 
  description: "Se solicita flyer para publicitar en redes sociales (Facebook e Instagram).", 
  cost: 30,
  deadline: Date.new(2021, 3, 13, 12),
  status: "Cerrado", 
  user: branca
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
uxdesign = Category.create(title: 'Diseño UX/UI')
uxdesign.photo.attach(io: ux_design_photo, filename: 'uxdesign.png', content_type: 'image/png')

puts "Creando relaciones project-category"
CategoryProject.create( project: branca_photo, category: photography )
CategoryProject.create( project: branca_flyer, category: photography )

CategoryProject.create( project: branca_logo, category: diseno_grafico )

CategoryProject.create( project: pwc_software, category: uxdesign )

CategoryProject.create( project: cuareim_3d, category: video )
CategoryProject.create( project: pwc_video, category: video )
CategoryProject.create( project: branca_video, category: video )

CategoryProject.create( project: correo_argentino, category: uxdesign )
CategoryProject.create( project: cuareim_redes, category: diseno_grafico )

CategoryProject.create( project: branca_web, category: photography )
CategoryProject.create( project: pwc_web, category: uxdesign )
CategoryProject.create( project: branca_web, category: uxdesign )

CategoryProject.create( project: cuareim_facebook, category: diseno_grafico )
CategoryProject.create( project: pwc_md, category: uxdesign )

CategoryProject.create( project: loreal, category: diseno_grafico )

puts "Creando postulaciones"

branca_nico = Postulation.create(file: 'https://www.globalpremiumbrands.com/images/html/aperitivo-fernet-branca-logo_inside.png', user: nico, project: branca_logo, description: "Colores, aromas, sabores y… ¡poderes! El logo hace referencia a la receta de Fernet-Branca. Cada parte de este logo es un universo, una experiencia, un descubrimiento.")
branca_cami = Postulation.create(user: camilo, project: branca_logo, description: "Free white and black logo vector.")
file = URI.open('https://gtswiki.gt-beginners.net/decal/png/00/48/08/7278481107283084800_1.png')
branca_cami.photo.attach(io: file, filename: 'logo_branca.png', content_type: 'image/png')
branca_photo_natalia = Postulation.create(file: 'https://www.instagram.com/fotografiaempresarial/?hl=es-la', user: natalia, project: branca_photo, description: "/MOMENTOS REALES/ INSTANTES PRECISOS/")
branca_web_natalia = Postulation.create(file: 'https://blog.desdelinux.net/nextcloud-hub-20-llega-con-mejoras-de-integracion-optimizacion-y-mas/', user: natalia, project: branca_web, description: "Propuesta de mejoras para Nextcloud Hub 20.")
branca_video_facundo = Postulation.create(file: 'https://www.youtube.com/watch?v=D4PP1mei-aE', user: facundo, project: branca_video, description: "Un vídeo lleno de imágenes frescas, que invocan los sentimientos de placer desde el primer momento.")
branca_flyer_camilo = Postulation.create(file: 'https://i.pinimg.com/originals/ff/9e/e4/ff9ee42c9d576e001a271cc88f2a6d89.jpg', user: camilo, project: branca_flyer, description: "Se buscó mantener los colores y la simplicidad que resaltan a la marca.")

puts "Creando reviews"

branca_review_facu = Review.create(comment: "Ha sido un placer este trabajo. El cliente muy atento. Ha revisado todos los detalles. Seguro trabajaremos juntos nuevamente.", rating: 5, user: facundo, postulation: branca_video_facundo )
branca_review_cami = Review.create(comment: "Muy buena experiencia. una empresa comprometida con el proyecto que genera, sólo algunas demoras en la respuesta.", rating: 4, user: camilo, postulation: branca_flyer_camilo )


puts "Seeds creadas"

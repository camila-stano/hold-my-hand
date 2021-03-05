require 'faker'
require "open-uri"

puts '-----------------------------'
puts 'Cleaning up database...'
puts '-----------------------------'

Restaurant.destroy_all
Shelter.destroy_all
Document.destroy_all
Lawyer.destroy_all
School.destroy_all
Communication.destroy_all

puts '-----------------------------'
puts 'Database is clear!'
puts '-----------------------------'
puts 'Creating Restaurants!'
puts '-----------------------------'

# latitude e longitude errados, inserir manualmente pelo rails c. latitude: -23.547794222490886, longitude: -46.63069957419347
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614706687/bomprato_f0ruvk.jpg')
restaurant = Restaurant.create!(name: "Bom prato", address: "Rua 25 de Março, 166, Centro, São Paulo", phone: nil, price: 2)
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "Restaurant Bom Prato created"
puts '-----------------------------'

file = URI.open('https://cdn4.ecycle.com.br/cache/images/eDicas/alimentos/50-600-bom-prato-525.jpg')
restaurant = Restaurant.create!(name: "Popular", address: "Rua Barão de Ladário, 204, Brás, São Paulo", phone: "(11) 2292-4151", price: 1)
puts "Restaurant Popular created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614708902/sesc_bwr69u.png')
restaurant = Restaurant.create!(name: "Comedoria Sesc Pinheiros", address: "Rua Pais Leme, 195, Pinheiros, São Paulo", phone: nil, price: 10)
puts "Restaurant Comedoria Sesc Pinheiros created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


puts '-----------------------------'
puts 'Creating Shelters!'
puts '-----------------------------'

# latitude e longitude errados, inserir manualmente pelo rails c.
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614709677/acnur_pofhwh.png')
shelter = Shelter.create!(name: "Acnur", address: "Largo Páteo do Colégio, 148, Centro Histórico de São Paulo, São Paulo", phone: "(11) 3101-2921")
puts "Shelter Acnur created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png') 

file = URI.open('https://ogimg.infoglobo.com.br/mundo/23292355-a4d-377/FT1086A/652/80102016_interSao-Paulo-SP-29-11-2018-PadreMigrantesTrabalho-com-migrantes-do-padre-Pao.jpg')
shelter = Shelter.create!(name: "Missão Paz São Paulo", address: "Rua Glicério, 225, Liberdade, São Paulo", phone: "(11) 3340-6950", opening_hours: "Não informado", description: "A Missão Paz é uma instituição filantrópica de apoio e acolhimento a imigrantes e refugiados na cidade de São Paulo. Pertencente aos missionários Scalabrinianos, ela atua em favor do público migrante desde os anos trinta do século XX. Ao longo de sua história, ela recebeu italianos, vietnamitas, coreanos, chilenos, bolivianos, paraguaios, peruanos, congoleses, angolanos, nigerianos, colombianos, haitianos, venezuelanos, entre tantos outros povos do mundo. Atualmente, a instituição atende indívuos de mais de 70 nacionalidades.")

puts "Shelter Missão Paz São Paulo created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# latitude e longitude errados, inserir manualmente pelo rails c.
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614709666/caritas_wpgzyf.png')
shelter = Shelter.create!(name: "Caritas Arquidiocesana de São Paulo", address: "Rua José Bonifácio, 107, 2º andar, Sé, São Paulo", phone: "(11) 94574-6358")
puts "Shelter Caritas Arquidiocesana de São Paulo created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  

puts '-----------------------------'
puts 'Creating Documents!'
puts '-----------------------------'

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/T%C3%ADtulo_eleitoral_qybuhu.jpg')
document = Document.create!(
  document_type: 'Título eleitoral',
  public_agency: Faker::FunnyName.name,
  address: Faker::Address.street_name,
  contact: Faker::Internet.email,
  opening_hours: "#{rand(6..9)}h - #{rand(18..22)}",
  required_docs: Faker::FunnyName.name,
  url_agency: Faker::Internet.url
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document #1 created"
puts '-----------------------------'

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/CPF_image_w1djl0.jpg')
document = Document.create!(
  document_type: 'CPF',
  public_agency: Faker::FunnyName.name,
  address: Faker::Address.street_name,
  contact: Faker::Internet.email,
  opening_hours: "#{rand(6..9)}h - #{rand(18..22)}h",
  required_docs: Faker::FunnyName.name,
  url_agency: Faker::Internet.url
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document #2 created"
puts '-----------------------------'

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/RG_image_f4bbjr.webp')
document = Document.create!(
  document_type: 'Carteira de identidade',
  public_agency: Faker::FunnyName.name,
  address: Faker::Address.street_name,
  contact: Faker::Internet.email,
  opening_hours: "#{rand(6..9)}h - #{rand(18..22)}",
  required_docs: Faker::FunnyName.name,
  url_agency: Faker::Internet.url
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document #3 created"
puts '-----------------------------'

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/carteira_de_habilita%C3%A7%C3%A3o_image_sdnw3n.jpg')
document = Document.create!(
  document_type: 'Carteira de habilitação',
  public_agency: Faker::FunnyName.name,
  address: Faker::Address.street_name,
  contact: Faker::Internet.email,
  opening_hours: "#{rand(6..9)}h - #{rand(18..22)}",
  required_docs: Faker::FunnyName.name,
  url_agency: Faker::Internet.url
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document #4 created"
puts '-----------------------------'

puts '-----------------------------'
puts 'Creating Lawyers!'
puts '-----------------------------'

5.times do 
  file = URI.open('https://source.unsplash.com/featured/?avatar')
  lawyer = Lawyer.create!(
    name: Faker::FunnyName.name,
    oab: "#{rand(1000000000..9999999999)}",
    address: Faker::Address.street_name,
    phone: Faker::PhoneNumber.cell_phone,
    area: "imigração",
    description: "Mantém-se pautado em prestar serviços personalizados aos seus clientes, permitir o acompanhamento próximo e a colaboração em todas as fases e desdobramentos de suas demandas jurídicas"
    )
  lawyer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "Lawyer #{lawyer.id} created"
  puts '-----------------------------'
end

puts '-----------------------------'
puts 'Creating Schools!'
puts '-----------------------------'

5.times do 
 school = School.create!(
   language: "Portuguese",
   openning_hours: "#{rand(6..9)}h - #{rand(18..22)}h",
   address: Faker::Address.street_name,
   instituition: Faker::University.name,
   contact: Faker::Internet.email,
   url_instituition: Faker::Internet.url
  )

  
  puts "School #{school.id} created"
  puts '-----------------------------'

end

puts '-----------------------------'
puts 'Creating Communication!'
puts '-----------------------------'

5.times do 
 communication = Communication.create!(
   phrase: Faker::TvShows::DrWho.quote,
   translation: Faker::TvShows::DrWho.quote,
  )

  puts "Communication #{communication.id} created"
  puts '-----------------------------'

end

puts "...finished seeds!!!"
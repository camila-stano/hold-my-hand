require 'faker'
require "open-uri"

puts '-----------------------------'
puts 'Cleaning up database...'
puts '-----------------------------'

Restaurant.destroy_all
Shelter.destroy_all

puts '-----------------------------'
puts 'Database is clear!'
puts '-----------------------------'
puts 'Creating Restaurants!'
puts '-----------------------------'


file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614706687/bomprato_f0ruvk.jpg')
restaurant = Restaurant.create!(name: "Bom prato", address: "R. 25 de Março, 166, Centro, São Paulo, SP", phone: nil, price: 2)
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "Restaurant Bom Prato created"
puts '-----------------------------'

file = URI.open('https://cdn4.ecycle.com.br/cache/images/eDicas/alimentos/50-600-bom-prato-525.jpg')
restaurant = Restaurant.create!(name: "Popular", address: "R. Barão de Ladário, 204, Brás", phone: "(11) 2292-4151", price: 1)
puts "Restaurant Popular created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614708902/sesc_bwr69u.png')
restaurant = Restaurant.create!(name: "Comedoria Sesc Pinheiros", address: "R. Pais Leme, 195, Pinheiros, São Paulo - SP, Brasil. 05424-150", phone: nil, price: 10)
puts "Restaurant Comedoria Sesc Pinheiros created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


puts '-----------------------------'
puts 'Creating Shelters!'
puts '-----------------------------'


Shelter.create!(name: "Acnur", address: "Largo Páteo do Colégio, 148 - Centro Histórico de São Paulo, São Paulo - SP", phone: "(11) 3101-2921")
puts "Shelter Acnur created"
puts '-----------------------------'

Shelter.create!(name: "Missão Paz São Paulo", address: "Rua Glicério, 225, Liberdade, São Paulo", phone: "(11) 3340-6950")
puts "Shelter Missão Paz São Paulo created"
puts '-----------------------------'

Shelter.create!(name: "Caritas Arquidiocesana de São Paulo", address: "R. José Bonifácio, 107 - 2º andar - Sé, São Paulo", phone: "(11) 94574-6358")
puts "Shelter Caritas Arquidiocesana de São Paulo created"
puts '-----------------------------'
  

puts '-----------------------------'
puts 'Creating Documents!'
puts '-----------------------------'

5.times do 
  document = Document.create!(
    document_type: Faker::FunnyName.name,
    public_agency: Faker::FunnyName.name,
    address: Faker::Address.street_name,
    contact: Faker::Internet.email,
    opening_hours: "#{rand(6..9)}h - #{rand(18..22)}",
    required_docs: Faker::FunnyName.name,
    url_agency: Faker::Internet.url
  )
  
  puts "Document #{document.id} created"
  puts '-----------------------------'

end

puts "...finished seeds!!!"
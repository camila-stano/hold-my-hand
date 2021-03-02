require 'faker'

puts '-----------------------------'
puts 'Cleaning up database...'
puts '-----------------------------'

Restaurant.destroy_all
Shelter.destroy_all
Document.destroy_all
Lawyer.destroy_all
School.destroy_all

puts '-----------------------------'
puts 'Database is clear!'
puts '-----------------------------'
puts 'Creating Restaurants!'
puts '-----------------------------'

5.times do 
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_name,
    price: rand(1..5)
  )
  
  puts "Restaurant #{restaurant.id} created"
  puts '-----------------------------'

end

puts '-----------------------------'
puts 'Creating Shelters!'
puts '-----------------------------'

5.times do 
  shelter = Shelter.create!(
    name: Faker::FunnyName.name,
    address: Faker::Address.street_name,
    phone: Faker::PhoneNumber.cell_phone,
  )
  
  puts "Shelter #{shelter.id} created"
  puts '-----------------------------'

end

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

puts '-----------------------------'
puts 'Creating Lawyers!'
puts '-----------------------------'

5.times do 
 lawyer = Lawyer.create!(
   name: Faker::FunnyName.name,
   oab: "#{rand(1000000000..9999999999)}",
   address: Faker::Address.street_name,
   phone: Faker::PhoneNumber.cell_phone,
   area: "imigração",
   description: "Mantém-se pautado em prestar serviços personalizados aos seus clientes, permitir o acompanhamento próximo e a colaboração em todas as fases e desdobramentos de suas demandas jurídicas"
  )
  
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


puts "...finished seeds!!!"
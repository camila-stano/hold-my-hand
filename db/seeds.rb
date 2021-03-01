require 'faker'

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

puts "...finished seeds!!!"
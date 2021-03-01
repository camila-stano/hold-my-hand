require 'faker'

puts '-----------------------------'
puts 'Cleaning up database...'
puts '-----------------------------'

Restaurant.destroy_all

puts '-----------------------------'
puts 'Database is clear!'
puts '-----------------------------'
puts 'Creating Restaurant!'
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
require "faker"
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

#-----------------------------------------------RESTAURANTS-----------------------------------------------#

puts '-----------------------------'
puts 'Creating Restaurants!'
puts '-----------------------------'

# latitude: -23.547794222490886, longitude: -46.63069957419347
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614706687/bomprato_f0ruvk.jpg')
restaurant = Restaurant.create!(name: "Bom prato", address: "Rua 25 de Março, 166, Centro, São Paulo", phone: '(11) 3334-2977', price: 2)
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "Restaurant Bom Prato created"
puts '-----------------------------'

# latitude: -23.540053644785395, longitude -46.61847401652173
file = URI.open('https://cdn4.ecycle.com.br/cache/images/eDicas/alimentos/50-600-bom-prato-525.jpg')
restaurant = Restaurant.create!(name: "Popular", address: "Rua Barão de Ladário, 204, Brás, São Paulo", phone: "(11) 2292-4151", price: 1)
puts "Restaurant Popular created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# latitude: -23.56729892520476, longitude: -46.69768310488062
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614708902/sesc_bwr69u.png')
restaurant = Restaurant.create!(name: "Comedoria Sesc Pinheiros", address: "Rua Pais Leme, 195, Pinheiros, São Paulo", phone: '(11) 3095-9400', price: 10)
puts "Restaurant Comedoria Sesc Pinheiros created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#-----------------------------------------------SHELTERS-----------------------------------------------#

puts '-----------------------------'
puts 'Creating Shelters!'
puts '-----------------------------'

# latitude: -23.548229765611094, longitude: -46.63260980923216
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614709677/acnur_pofhwh.png')
shelter = Shelter.create!(name: "Acnur", address: "Largo Páteo do Colégio, 148, Centro Histórico de São Paulo, São Paulo", phone: "(11) 3101-2921", opening_hours: "Não informado", description: "UNHCR, the UN Refugee Agency, is a global organization dedicated to saving lives, protecting rights and building a better future for refugees, forcibly displaced communities and stateless people.", link: "https://www.unhcr.org/")
puts "Shelter Acnur created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png') 

# latitude: -23.554524021420384, longitude: -46.62781280302922
file = URI.open('https://ogimg.infoglobo.com.br/mundo/23292355-a4d-377/FT1086A/652/80102016_interSao-Paulo-SP-29-11-2018-PadreMigrantesTrabalho-com-migrantes-do-padre-Pao.jpg')
shelter = Shelter.create!(name: "Missão Paz São Paulo", address: "Rua Glicério, 225, Liberdade, São Paulo", phone: "(11) 3340-6950", opening_hours: "Não informado", description: "Missão Paz is a philanthropic institution that supports and welcomes immigrants and refugees in the city of São Paulo. Belonging to the Scalabrinian missionaries, it has been working for the migrant public since the thirties of the twentieth century.", link: "http://www.missaonspaz.org/")

puts "Shelter Missão Paz São Paulo created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# latitude: -23.548844148671385, longitude: -46.63525810117761
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614709666/caritas_wpgzyf.png')
shelter = Shelter.create!(name: "Caritas Arquidiocesana de São Paulo", address: "Rua José Bonifácio, 107, 2º andar, Sé, São Paulo", phone: "(11) 94574-6358", description: "Caritas Internationalis is confederation of over 160 members who are working at the grassroots in almost every country of the world. When a crisis hits, Caritas is already on the ground. The diverse members give us our strength – from small groups of volunteers to some of the biggest global charities. Inspired by Catholic faith, Caritas is the helping hand of the Church – reaching out to the poor, vulnerable and excluded, regardless of race or religion, to build a world based on justice and fraternal love.", link: "http://caritas.org.br/")
puts "Shelter Caritas Arquidiocesana de São Paulo created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  

#-----------------------------------------------DOCUMENTS-----------------------------------------------#

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

#-----------------------------------------------LAWYERS-----------------------------------------------#

puts '-----------------------------'
puts 'Creating Lawyers!'
puts '-----------------------------'

# latitude: -23.551303380484015, longitude: -46.63400312457595
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1615049363/WhatsApp_Image_2021-03-06_at_13.47.06_4_ud8mjz.jpg')
lawyer = Lawyer.create!(name: "Pedro Miguel Meinhartt", address: "Praça da Sé, 385 - Sé, São Paulo", phone: '(11) 3291-3777', oab: "#{rand(100..999)}.#{rand(100..999)}", area: "Civil Litigation", description: "Routinely go to court on behalf of clients are litigators, and many specialize in areas such as personal injury, corporate, tax, etc. The general term “civil litigator” refers to an attorney who represents clients in civil (not criminal) court, either as plaintiff or defendant.")
lawyer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "lawyer #{lawyer.name} created"
puts '-----------------------------'

# latitude: -23.551303380484015, longitude: -46.63400312457595
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1615049368/WhatsApp_Image_2021-03-06_at_13.47.06_2_iymojc.jpg')
lawyer = Lawyer.create!(name: "Erika Baracchini", address: "Praça da Sé, 385 - Sé, São Paulo", phone: '(11) 3291-3777', oab: "#{rand(100..999)}.#{rand(100..999)}", area: "Immigration", description: 'Immigration lawyers help immigrants, and employers seeking to hire them, with legal issues related to the status of immigrants and their families. Immigration lawyers help with visas, green cards, citizenship, and asylum and refugee status. Immigration laws change constantly, so it’s important to consult an experienced attorney in these situations.')
lawyer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "lawyer #{lawyer.name} created"
puts '-----------------------------'

# latitude: -23.551303380484015, longitude: -46.63400312457595
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1615049373/WhatsApp_Image_2021-03-06_at_13.47.06_nxe1kl.jpg')
lawyer = Lawyer.create!(name: "André Toledo", address: "Praça da Sé, 385 - Sé, São Paulo", phone: '(11) 3291-3777', oab: "#{rand(100..999)}.#{rand(100..999)}", area: "Immigration", description: 'Immigration lawyers help immigrants, and employers seeking to hire them, with legal issues related to the status of immigrants and their families. Immigration lawyers help with visas, green cards, citizenship, and asylum and refugee status. Immigration laws change constantly, so it’s important to consult an experienced attorney in these situations.')
lawyer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "lawyer #{lawyer.name} created"
puts '-----------------------------'

# latitude: -23.551303380484015, longitude: -46.63400312457595
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1615049365/WhatsApp_Image_2021-03-06_at_13.47.06_3_n2etjd.jpg')
lawyer = Lawyer.create!(name: "João Guimarães ", address: "Praça da Sé, 385 - Sé, São Paulo", phone: '(11) 3291-3777', oab: "#{rand(100..999)}.#{rand(100..999)}", area: "Criminal Law", description: 'Criminal lawyers are attorneys who defend individuals and organizations against government charges in federal and state courts. Criminal lawyers understand the rules around arrest, arraignment, bail, pleas, proof, and related issues. Some of the most common crimes requiring criminal lawyers include homicide, sexual battery and assault.')
lawyer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "lawyer #{lawyer.name} created"
puts '-----------------------------'

# latitude: -23.551303380484015, longitude: -46.63400312457595
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1615049370/WhatsApp_Image_2021-03-06_at_13.47.06_1_e3qcub.jpg')
lawyer = Lawyer.create!(name: "Renata Bento", address: "Praça da Sé, 385 - Sé, São Paulo", phone: '(11) 3291-3777', oab: "#{rand(100..999)}.#{rand(100..999)}", area: "Employment Law", description: 'Both employees and employers seek out employment lawyers to deal with legal issues related to the workplace.  Some of the most common types of cases handled by employment lawyers are contracts, wrongful termination, workplace harassment, retaliation, and workplace discrimination.' )
lawyer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "lawyer #{lawyer.name} created"
puts '-----------------------------'


#-----------------------------------------------SCHOOLS-----------------------------------------------#


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
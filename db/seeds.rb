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
restaurant = Restaurant.create!(name: "Bom prato", address: "Rua 25 de Março, 166, Centro, São Paulo", phone: '(11) 3334-2977', price: 2)
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts "Restaurant Bom Prato created"
puts '-----------------------------'

# lat -23.540053644785395, lng -46.61847401652173
file = URI.open('https://cdn4.ecycle.com.br/cache/images/eDicas/alimentos/50-600-bom-prato-525.jpg')
restaurant = Restaurant.create!(name: "Popular", address: "Rua Barão de Ladário, 204, Brás, São Paulo", phone: "(11) 2292-4151", price: 1)
puts "Restaurant Popular created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# lat -23.56729892520476, lng -46.69768310488062
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614708902/sesc_bwr69u.png')
restaurant = Restaurant.create!(name: "Comedoria Sesc Pinheiros", address: "Rua Pais Leme, 195, Pinheiros, São Paulo", phone: '(11) 3095-9400', price: 10)
puts "Restaurant Comedoria Sesc Pinheiros created"
puts '-----------------------------'
restaurant.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


puts '-----------------------------'
puts 'Creating Shelters!'
puts '-----------------------------'

# lat -23.548229765611094, lng -46.63260980923216
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614709677/acnur_pofhwh.png')
shelter = Shelter.create!(name: "Acnur", address: "Largo Páteo do Colégio, 148, Centro Histórico de São Paulo, São Paulo", phone: "(11) 3101-2921", opening_hours: "Não informado", description: "UNHCR, the UN Refugee Agency, is a global organization dedicated to saving lives, protecting rights and building a better future for refugees, forcibly displaced communities and stateless people.")
puts "Shelter Acnur created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png') 

# lat -23.554524021420384, lng -46.62781280302922
file = URI.open('https://ogimg.infoglobo.com.br/mundo/23292355-a4d-377/FT1086A/652/80102016_interSao-Paulo-SP-29-11-2018-PadreMigrantesTrabalho-com-migrantes-do-padre-Pao.jpg')
shelter = Shelter.create!(name: "Missão Paz São Paulo", address: "Rua Glicério, 225, Liberdade, São Paulo", phone: "(11) 3340-6950", opening_hours: "Não informado", description: "Missão Paz is a philanthropic institution that supports and welcomes immigrants and refugees in the city of São Paulo. Belonging to the Scalabrinian missionaries, it has been working for the migrant public since the thirties of the twentieth century.")

puts "Shelter Missão Paz São Paulo created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# lat -23.548844148671385, lng -46.63525810117761
file = URI.open('https://res.cloudinary.com/dn6lyapiu/image/upload/v1614709666/caritas_wpgzyf.png')
shelter = Shelter.create!(name: "Caritas Arquidiocesana de São Paulo", address: "Rua José Bonifácio, 107, 2º andar, Sé, São Paulo", phone: "(11) 94574-6358", description: "Caritas Internationalis is confederation of over 160 members who are working at the grassroots in almost every country of the world. When a crisis hits, Caritas is already on the ground. The diverse members give us our strength – from small groups of volunteers to some of the biggest global charities. Inspired by Catholic faith, Caritas is the helping hand of the Church – reaching out to the poor, vulnerable and excluded, regardless of race or religion, to build a world based on justice and fraternal love.")
puts "Shelter Caritas Arquidiocesana de São Paulo created"
puts '-----------------------------'
shelter.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  

-

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/CPF_image_w1djl0.jpg')
document = Document.create!(
  document_type: 'Cadastro de Pessoa Física - CPF (Individual Tax Identification Number)',
  public_agency: "Receita Federal",
  address: "Can apply online", #Checar se podemos colocar url nesse campo
  contact: "atendimentorfb.08@rfb.gov.br",
  opening_hours: "Online process",
  required_docs: "Adults above 18 years old shall present the original or certified copy of his/her identity card, 
                  which can be the provisional protocol, the Card/RNE or even the passport. People under 18 years 
                  old shall present the original or certified copy of his/her identity card and the identity card 
                  of one of his/her parents or legal guardian.", #Informação extraida do site da Acnur
  url_agency: "https://servicos.receita.fazenda.gov.br/Servicos/CPF/InscricaoCpfEstrangeiro/default.asp"
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document CPF created"
puts '-----------------------------'

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/RG_image_f4bbjr.webp')
document = Document.create!(
  document_type: 'Carteira de Trabalho e Previdência Social - CTPS (Work permit and Social Security Card)',
  public_agency: "GOV BR",
  address: "Online",#Checar se podemos colocar url nesse campo
  contact: "",
  opening_hours: "Online process",
  required_docs: "CPF - Cadastro de Pessoa Física (Individual Tax Identification Number)",
  url_agency: "https://servicos.mte.gov.br/#/loginfailed/redirect="
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document CTPS created"
puts '-----------------------------'

file = URI.open('https://res.cloudinary.com/ofernandovegano/image/upload/v1614787827/carteira_de_habilita%C3%A7%C3%A3o_image_sdnw3n.jpg')
document = Document.create!(
  document_type: 'SUS - Unified Health System',
  public_agency: "GOV BR",
  address: "Online",#Checar se podemos colocar url nesse campo
  contact: "",
  opening_hours: "Online process",
  required_docs: "CPF - Cadastro de Pessoa Física (Individual Tax Identification Number)",
  url_agency: "https://cadastro.acesso.gov.br/nova-conta/cpf?clientid=contas.acesso.gov.br"
)
document.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Document #SUS created"
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
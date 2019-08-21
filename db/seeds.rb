# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Reservation.destroy_all
Queuer.destroy_all
User.destroy_all
ADDRESS = ["221 rue de tolbiac, paris", "16 villa gaudelet, paris", "9 rue oudinot, paris", "3 place d'italie, paris", "14 rue crespin du gast, paris", "30 boulevard saint-germain, paris", "30 boulevard de l'hopital, paris", "20 rue saint louis en l'ile, paris", "25 rue des ecoles, paris", "15 boulevard beaumarchais, paris", "2 rue de la bastille, paris", "112 avenue kleber, paris", "51 rue la boetie, paris", "54 rue de miromesnil, paris", "30 avnenue trudaine, paris", "12 rue de charonne, paris", "50 rue la fayette, paris", "121 boulevard haussmann, paris", "10 rue du renard, paris", "123 boulevard saint michel, paris", "12 rue gay-lussace, paris", "17 rue bonaparte, paris", "44 rue saint-antoine, paris", "22 rue de fleurus, paris", "1 rue de paris, paris", "5 rue alain, paris", "3 rue des abbesses, paris"]

url = "https://source.unsplash.com/random"
15.times do
  desco = ""
  rand(2..5).times do
    desco << Faker::Lorem.sentence
  end

  user = User.new(name: Faker::Name.name, email:Faker::Internet.email, password: "password", is_q: false, rating: rand(1..5), description: desco)
  sleep(2)
  user.remote_picture_url = url
  user.save
end


15.times do
  desc = ""
  rand(2..5).times do
    desc << Faker::Lorem.sentence
  end
  usere = User.new(name: Faker::Name.name, email:Faker::Internet.email, password: "password", is_q: true, rating: rand(1..5), description: desc)
  sleep(2)
  usere.remote_picture_url = url
  usere.save

  desca = ""
  rand(2..5).times do
    desca << Faker::Lorem.sentence
  end

  queuer = Queuer.new(address: ADDRESS.sample, description: desca, radius: rand(5...80), price_per_hour: rand(5...40), rating: rand(1..5))
  queuer.user = usere
  queuer.save

  descu = ""
  rand(2..5).times do
    descu << Faker::Lorem.sentence
  end

  client = User.new(name: Faker::Name.name, email:Faker::Internet.email, password: "password", is_q: false, rating: rand(1..5), description: descu)
  sleep(2)
  client.remote_picture_url = url
  client.save

  body = ""
  rand(5..15).times do
    body << Faker::Lorem.sentence
  end

  resa = Reservation.new(starts_at: DateTime.new(2019, 8, 19, 18, 00, 0), ends_at: DateTime.new(2019, 8, 19, 20, 00, 0), content: body, address: Faker::Address.full_address, statut: "waiting")
  resa.user = client
  resa.queuer = queuer
  resa.save

  resi = Reservation.new(starts_at: DateTime.new(2019, 8, 19, 18, 00, 0), ends_at: DateTime.new(2019, 8, 19, 20, 00, 0), content: body, address: Faker::Address.full_address, statut: "process")
  resi.user = client
  resi.queuer = queuer
  resi.save

  reso = Reservation.new(starts_at: DateTime.new(2019, 8, 19, 18, 00, 0), ends_at: DateTime.new(2019, 8, 19, 20, 00, 0), content: body, address: Faker::Address.full_address, statut: "finished")
  reso.user = client
  reso.queuer = queuer
  reso.save

  comment = ""
  rand(2..7).times do
    comment << Faker::Lorem.sentence
  end

  review = Review.new(content: comment, rating: rand(1..5))
  review.reservation = resi
  review.user = client
  review.save
end

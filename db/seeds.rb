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

  queuer = Queuer.new(address: Faker::Address.full_address, description: desca, radius: rand(5...80), price_per_hour: rand(5...40), rating: rand(1..5))
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

  resa = Reservation.new(starts_at: DateTime.new(2019, 8, 19, 18, 00, 0), ends_at: DateTime.new(2019, 8, 19, 20, 00, 0), content: body, address: Faker::Address.full_address)
  resa.user = client
  resa.queuer = queuer
  resa.save

  comment = ""
  rand(2..7).times do
    comment << Faker::Lorem.sentence
  end

  review = Review.new(content: comment, rating: rand(1..5))
  review.reservation = resa
  review.user = client
  review.save
end

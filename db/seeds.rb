# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Review.destroy_all
Reservation.destroy_all
Queuer.destroy_all
User.destroy_all

QUEUER_ADDRESS = [
  "221 rue de tolbiac, paris",
  "16 villa gaudelet, paris",
  "9 rue oudinot, paris",
  "3 place d'italie, paris",
  "14 rue crespin du gast, paris",
  "30 boulevard saint-germain, paris",
  "30 boulevard de l'hopital, paris",
  "20 rue saint louis en l'ile, paris",
  "25 rue des ecoles, paris",
  "15 boulevard beaumarchais, paris",
  "2 rue de la bastille, paris",
  "112 avenue kleber, paris",
  "51 rue la boetie, paris",
  "54 rue de miromesnil, paris",
  "30 avenue trudaine, paris",
  "12 rue de charonne, paris",
  "50 rue la fayette, paris",
  "121 boulevard haussmann, paris",
  "10 rue du renard, paris",
  "123 boulevard saint michel, paris",
  "12 rue gay-lussace, paris",
  "17 rue bonaparte, paris",
  "44 rue saint-antoine, paris",
  "22 rue de fleurus, paris",
  "1 rue de paris, paris",
  "5 rue alain, paris",
  "3 rue des abbesses, paris"
]
WAITING_ADDRESS_NAME=[
  "Musée du Louvre",
  "Musée d'Orsay",
  "Centre Pompidou",
  "Musée du Quai Branly",
  "Galeries nationales du Grand Palais",
  "AccorHotels Arena",
  "Maison de la radio",
  "Palais des Congrès",
  "L'Olympia",
  "Zénith",
  "Fondation Louis Vuitton",
  "Musée d'Orsay",
  "Musée de l'Orangerie",
  "Musée Grévin",
  "Musée de l'Armée - Invalides"
]
WAITING_ADDRESS_SITE=[
  "pyramide du louvre, paris",
  "1 rue de la legion d'honneur, paris",
  "place georges pompidou, paris",
  "37 quai branly, paris",
  "3 avenue du general eisenhower, paris",
  "8 boulevard de bercy, paris",
  "116 avenue du president kennedy, paris",
  "2 place de la porte maillot, paris",
  "28 boulevard des capucines, paris",
  "211 avenue jean jaures, paris",
  "8 avenue du mahatma gandhi, paris",
  "1 rue de la legion d'honneur, paris",
  "jardin des tuileries, paris",
  "10 boulevard de montmartre, paris",
  "129 rue de grennelle, paris"
]
PROCESS_ADDRESS_NAME=[
  "Musée national Picasso",
  "Musée d'Art moderne de la Ville de Paris",
  "Cité des sciences et de l'industrie",
  "Tour Eiffel",
  "Museum Nationale d'Histoires Naturelles",
  "La Cigale",
  "Casino de Paris",
  "Le Bataclan",
  "Louxor",
  "Fondation Louis Vuitton",
  "Musée d'Orsay",
  "Musée de l'Orangerie",
  "Musée Grévin",
  "Musée de l'Armée - Invalides",
  "Philarmonie de Paris",
]
PROCESS_ADDRESS_SITE=[
  "5 rue de thorigny, paris",
  "12 avenue de new york, paris",
  "30 avenue corentin cariou, paris",
  "tour eiffel, paris",
  "57 rue cuvier, paris",
  "120 boulevard de rochechouart, paris",
  "16 rue de clichy, paris",
  "50 boulevard voltaire, paris",
  "170 boulevard de magenta, paris",
  "8 avenue du mahatma gandhi, paris",
  "1 rue de la legion d'honneur, paris",
  "jardin des tuileries, paris",
  "10 boulevard de montmartre, paris",
  "129 rue de grennelle, paris",
  "221 avenue jean jaures, paris",
]
FINISHED_ADDRESS_NAME=[
  "Fondation Louis Vuitton",
  "Musée d'Orsay",
  "Musée de l'Orangerie",
  "Musée Grévin",
  "Musée de l'Armée - Invalides",
  "Philarmonie de Paris",
  "AccorHotels Arena",
  "Maison de la radio",
  "Palais des Congrès",
  "L'Olympia",
  "Zénith",
  "La Cigale",
  "Casino de Paris",
  "Le Bataclan",
  "Louxor"
]
FINISHED_ADDRESS_SITE=[
  "8 avenue du mahatma gandhi, paris",
  "1 rue de la legion d'honneur, paris",
  "jardin des tuileries, paris",
  "10 boulevard de montmartre, paris",
  "129 rue de grennelle, paris",
  "221 avenue jean jaures, paris",
  "8 boulevard de bercy, paris",
  "116 avenue du president kennedy, paris",
  "2 place de la porte maillot, paris",
  "28 boulevard des capucines, paris",
  "211 avenue jean jaures, paris",
  "120 boulevard de rochechouart, paris",
  "16 rue de clichy, paris",
  "50 boulevard voltaire, paris",
  "170 boulevard de magenta, paris"
]

URL = "https://source.unsplash.com/random"

puts "Seeding users who are not queuer nor client..."
15.times do
  # Users (Non-queuer, non-client)
  user = User.new(
    name:           Faker::Name.name,
    email:          Faker::Internet.email,
    password:       "password",
    is_q:           false,
    rating:         rand(1..5),
    description:    "Welcome on my profile! I am fond of cultural visits and like how the app allows to find queuers so easily!"
  )
  user.remote_picture_url = URL
  sleep(2)
  user.save
end

puts "Seeding queuers, clients, reservations..."
i = 0
j = 0
15.times do
  # Users (Queuer, non-client)
  user = User.new(
    name:           Faker::Name.name,
    email:          Faker::Internet.email,
    password:       "password",
    is_q:           true,
    rating:         rand(1..5),
    description:    "Welcome on my profile!  I offer my time to queue for you from time to time, don't hesitate to book me!"
  )
  user.remote_picture_url = URL
  sleep(2)
  user.save

  # Queuers (non-client)
  queuer = Queuer.new(
    address:        QUEUER_ADDRESS[i],
    description:    "Welcome on my profile!  I offer my time to queue for you from time to time, don't hesitate to book me!",
    radius:         rand(1...3),
    price_per_hour: rand(5...40),
    rating:         rand(1..5)
    )
  sleep(2)
  queuer.user = user
  queuer.save
  i += 1

  # Clients (Users that have a reservation, and who are not queuer)
  client = User.new(
    name:           Faker::Name.name,
    email:          Faker::Internet.email,
    password:       "password",
    is_q:           false,
    rating:         rand(1..5),
    description:    "Welcome on my profile! I am fond of cultural visits and like how the app allows to find queuers so easily!"
  )
  client.remote_picture_url = URL
  sleep(2)
  client.save

  # Seeding reservations with status "Waiting"
  waiting_reservation = Reservation.new(
    starts_at:      DateTime.new(2019, 8, 19, 18, 00, 0),
    ends_at:        DateTime.new(2019, 8, 19, 20, 00, 0),
    content:        WAITING_ADDRESS_NAME[j],
    address:        WAITING_ADDRESS_SITE[j],
    statut:         "waiting"
  )
  waiting_reservation.queuer = queuer
  waiting_reservation.user = client
  waiting_reservation.save

  # Seeding reservations with status "Process"
  process_reservation = Reservation.new(
    starts_at:      DateTime.new(2019, 8, 19, 18, 00, 0),
    ends_at:        DateTime.new(2019, 8, 19, 20, 00, 0),
    content:        PROCESS_ADDRESS_NAME[j],
    address:        PROCESS_ADDRESS_SITE[j],
    statut:         "process"
  )
  process_reservation.queuer = queuer
  process_reservation.user = client
  process_reservation.save

  # Seeding reservations with status "Process"
  finished_reservation = Reservation.new(
    starts_at:      DateTime.new(2019, 8, 19, 18, 00, 0),
    ends_at:        DateTime.new(2019, 8, 19, 20, 00, 0),
    content:        FINISHED_ADDRESS_NAME[j],
    address:        FINISHED_ADDRESS_SITE[j],
    statut:         "finished"
  )
  finished_reservation.queuer = queuer
  finished_reservation.user = client
  finished_reservation.save


  review = Review.new(
    content:        "Was a bit worried as an early adopter, but finally very happy with this new app/service overall as well as with the queuer who stood for me! Had come just on time to pass the line!",
    rating:         rand(1..5)
  )
  review.reservation = finished_reservation
  review.user = client
  review.save

  j += 1
end

puts 'Seeding is done!'


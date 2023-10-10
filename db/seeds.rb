# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seeds.rb

# Create Users
user1 = User.create(
  name: 'John Doe',
  email: 'john@example.com',
  password: 'password123',
  role: 'admin'
)

# Create Rooms
room1 = Room.create(
  name: 'Standard Room',
  price: 100.00,
  description: 'A comfortable standard room with a view.',
  image: 'standard_room.jpg',
  room_type: 'Standard'
)

room2 = Room.create(
  name: 'Deluxe Suite',
  price: 200.00,
  description: 'A luxurious deluxe suite with all amenities.',
  image: 'deluxe_suite.jpg',
  room_type: 'Deluxe'
)

room3 = Room.create(
  name: 'Deluxe Suite',
  price: 200.00,
  description: 'A luxurious deluxe suite with all amenities.',
  image: 'deluxe_suite.jpg',
  room_type: 'Deluxe'
)

room4 = Room.create(
  name: 'Deluxe Suite',
  price: 200.00,
  description: 'A luxurious deluxe suite with all amenities.',
  image: 'deluxe_suite.jpg',
  room_type: 'Deluxe'
)

room5 = Room.create(
  name: 'Deluxe Suite',
  price: 200.00,
  description: 'A luxurious deluxe suite with all amenities.',
  image: 'deluxe_suite.jpg',
  room_type: 'Deluxe'
)

# Create Reservations
reservation1 = Reservation.create(
  check_in: DateTime.now + 1.day,
  check_out: DateTime.now + 4.days,
  user: user1,
  room: room1 
)


puts 'Seed data created successfully.'

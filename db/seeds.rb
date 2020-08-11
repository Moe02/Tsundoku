# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying user"
User.destroy_all
puts "creating user .."
User.create!(
  email: "user1@kittymail.com",
  password: "123456"
)

User.create!(
  email: "user2@kittymail.com",
  password: "123456"
)

User.create!(
  email: "user3@kittymail.com",
  password: "123456"
)

User.create!(
  email: "user4@kittymail.com",
  password: "123456"
)

User.create!(
  email: "user5@kittymail.com",
  password: "123456"
)

puts "Created #{User.count} users"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

isbns = ['0451526538', '0345250761', '0307386457', '0002008408', '0755392620', '0375420525', '0099528487']


puts "Cleaning book DB..."
Book.destroy_all

puts "Creating new books..."
isbns.each do |isbn|
  url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
  book_raw_data = open(url).read
  book_raw_hash = JSON.parse(book_raw_data)
  book_hash = book_raw_hash["ISBN:#{isbn}"]
  # book_hash["title"]
  # book_hash["authors"].first["name"]
  Book.create!(
    title: book_hash["title"],
    author: book_hash["authors"].first["name"]
  )
end

puts "#{Book.count} books created."

puts "Cleaning users..."
User.destroy_all

puts "Creating new users..."
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "#{User.count} Users created."
puts "Cleaning User Book DB..."
UserBook.destroy_all

puts "Creating example user books..."

users = User.all
books = Book.all
users.each do |user|
  rand(1..4).times do
    UserBook.create!(
      user: user,
      book: books.sample
    )
  end
end

puts "#{UserBook.count} user books created."

puts "Seed complete!"

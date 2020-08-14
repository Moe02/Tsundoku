# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

isbns = ['0451526538', '2207109089', '0307386457', '0002008408', '0755392620', '0375420525', '0099528487', '9781784871055', '0765379295', '0393334155', '0393355942', '0062119044', ' 0679735771', '0393341763', '0812988523', '9780451526342', '0399501487', '9780140424393', '0441569595', '0553380958', '0345404475', '0679728759', '1583226982', '1779501129', '034549752X', '0553283685', '0140232923', '0375726543', '0679733787', '0679761047', '0679775439', '0765335301', '0441627404', '054792822X', '0575086254']

puts "Cleaning requests..."
Request.destroy_all
puts "Cleaning User Books..."
UserBook.destroy_all
puts "Cleaning books..."
Book.destroy_all
puts "Cleaning users..."
User.destroy_all

puts "Creating new books..."
isbns.each do |isbn|
  url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
  book_raw_data = open(url).read
  book_raw_hash = JSON.parse(book_raw_data)
  book_hash = book_raw_hash["ISBN:#{isbn}"]
  next unless book_hash
  book_hash["cover"] ? cover = book_hash["cover"]["large"] : cover = ""
  keywords = []
  if book_hash["authors"].class == Array
    author = book_hash["authors"].first["name"]
  else
    author = ""
  end
  if book_hash["subjects"]
    book_hash["subjects"].each do |hash|
      keywords << hash["name"]
    end
  end

  next unless cover.present?
    Book.create!(
    title: book_hash["title"],
    author: author,
    cover: cover,
    keywords: keywords
    )
end

puts "#{Book.count} books created."

puts "Creating new users..."
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    username: Faker::Name.first_name
  )
end

User.create!(
    email: "rob@caramail.com",
    password: "password",
    username: "rob"
  )

User.create!(
    email: "veronica@caramail.com",
    password: "password",
    username: "veronica"
  )

User.create!(
    email: "moe@caramail.com",
    password: "password",
    username: "moe"
  )
puts "#{User.count} Users created."


puts "Creating example user books..."
users = User.all
books = Book.all
users.each do |user|
  rand(5..10).times do
    UserBook.create!(
      user: user,
      book: books.sample
    )
  end
end
puts "#{UserBook.count} user books created."


puts "Generating requests"
userbooks = UserBook.all
users.each do |user|
  rand(5..15).times do
    Request.create!(
      user: user,
      user_book: userbooks.sample,
      status: ["pending", "active", "history"].sample
    )
  end
end
puts "#{Request.count} requests created."


puts "Seed complete!"

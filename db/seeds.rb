# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

isbns = [0451526538, 0345250761, 1436126290, 0307386457, 8087830032, 0002008408, 0755392620, 1783527609, 0375420525, 9525904873, 0099528487]


isbns.each do |isbn|
  url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
  book_raw_data = open(url).read
  book_raw_hash = JSON.parse(book_raw_data)
  book_hash = book_raw_hash["ISBN:#{isbn}"]
  Book.create!(
    title: book_hash["title"]
    author: book_hash["authors"].first["name"]
  )
end

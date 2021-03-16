# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# Creates 3 users
  # manually entered data :
    # "first_name" "last_name" "username" "email" "bio"
    # "geolocation" (V1 = city, V2 = address)
  # photo ?

# Create 1 Library for each User : "user_id"

# Creates 30 books
  # Find 30 ISBN exact code
  # Find the book with Google Api, Get the JSON file
  # Parse JSON and create the Instance
    # "ISBN" "title" "year" ("publishedDate") "genre" "language"
    # needed : description, author, page_count, thumbnail_url, google_id



# Creates 10 x 3 library_books
  # Associate the Instance of the Book to A random User
  # Add a "book_condition" for each library_book



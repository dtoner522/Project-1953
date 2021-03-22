# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WishlistBook.delete_all
LibraryBook.delete_all
Wishlist.delete_all
Library.delete_all
User.delete_all
Book.delete_all



# CREATE 3 USERS

user1 = User.new( {
    first_name: "Eula",
    last_name: "Gonzales",
    username: "eulag", # DELETE USERNAME
    email: "eula@eula.com",
    password: "password",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.",
    location: "Barcelona"
  } )
avatar1 = URI.open('https://images.unsplash.com/photo-1503235930437-8c6293ba41f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')
user1.photo.attach(io: avatar1, filename: 'pic.png', content_type: 'image/png')
user1.save

user2 = User.new( {
    first_name: "Guillaume",
    last_name: "Martinez",
    username: "guille433",
    email: "guill@aume.fr",
    password: "password",
    bio: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.",
    location: "Toulouse"
  } )
avatar2 = URI.open('https://images.unsplash.com/photo-1581391528803-54be77ce23e3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
user2.photo.attach(io: avatar2, filename: 'pic.png', content_type: 'image/png')
user2.save

# avatar3 = https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80
p "created #{User.count} User"
p " First user, N° #{User.first.id} : #{User.first.first_name} #{User.first.last_name}"
p " Last user, N° #{User.last.id} : #{User.last.first_name} #{User.last.last_name}"


# LIBRARY & WISHLIST are created automatically FOR EACH USER

p "created #{Library.count} libraries"

p "created #{Wishlist.count} wishlist"



# CREATE BOOKS (MANUAL)   - V2 is calling the google API with a isbn id and use the Data in the JSON

book1 = Book.new( {isbn: '', title:'To Kill a Mockingbird', year: '1984', genre: 'science-fiction', language: 'EN',
  description: 'Let your pen fly across the page in this sophisticated notebook, featuring Ernest Hemingway’s most inspiring words',
  author: 'Harper Lee', page_count: '534', thumbnail_url: ''
})
img1 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553383690l/2657.jpg')
book1.photo.attach(io: img1, filename: 'thumbnail.png', content_type: 'image/png')
book1.save


book2 = Book.new( {isbn: '', title:'1984', year: '1984', genre: 'science-fiction', language: 'EN',
  description: 'Let your pen fly across the page in this sophisticated notebook, featuring Ernest Hemingway’s most inspiring words',
  author: 'George Orwell', page_count: '344', thumbnail_url: ''
})
img2 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348990566l/5470.jpg')
book2.photo.attach(io: img2, filename: 'thumbnail.png', content_type: 'image/png')
book2.save


book3 = Book.new( {isbn: '', title:'The Lord of the Rings', year: '2001', genre: 'science-fiction', language: 'EN',
  description: 'Let your pen fly across the page in this sophisticated notebook, featuring Ernest Hemingway’s most inspiring words',
  author: 'J.R.R. Tolkien', page_count: '120', thumbnail_url: ''
})
img3 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1566425108l/33.jpg')
book3.photo.attach(io: img3, filename: 'thumbnail.png', content_type: 'image/png')
book3.save


book4 = Book.new( {isbn: '', title:'The Great Gatsby', year: '1984', genre: 'science-fiction', language: 'EN',
  description: 'Let your pen fly across the page in this sophisticated notebook, featuring Ernest Hemingway’s most inspiring words',
  author: 'F.G. Fitzgerald', page_count: '433', thumbnail_url: ''
})
img4 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1490528560l/4671._SY475_.jpg')
book4.photo.attach(io: img4, filename: 'thumbnail.png', content_type: 'image/png')
book4.save


book5 = Book.new( {isbn: '', title:'Lord of the Flies', year: '1977', genre: 'science-fiction', language: 'EN',
  description: 'Let your pen fly across the page in this sophisticated notebook, featuring Ernest Hemingway’s most inspiring words',
  author: 'William Golding', page_count: '534', thumbnail_url: ''
})
img5 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1353029077l/100915.jpg')
book5.photo.attach(io: img5, filename: 'thumbnail.png', content_type: 'image/png')
book5.save


book6 = Book.new( {isbn: '', title:'Animal Farm', year: '1954', genre: 'science-fiction', language: 'EN',
  description: 'Let your pen fly across the page in this sophisticated notebook, featuring Ernest Hemingway’s most inspiring words',
  author: 'George Orwell', page_count: '534', thumbnail_url: ''
})
img6 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1424037542l/7613.jpg')
book6.photo.attach(io: img6, filename: 'thumbnail.png', content_type: 'image/png')
book6.save

p "created #{Book.count} Books"
p "The last book was #{Book.last.title}, from author #{Book.last.author}. It's #{Book.last.page_count} long !"


# BOOK SEED V2
  # Find 30 isbn exact code
  # Find the book with Google Api, Get the JSON file
  # Parse JSON and create the Instance
    # "isbn" "title" "year" ("publishedDate") "genre" "language"
    # needed : description, author, page_count, thumbnail_url, google_id


# CREATE LIBRARY_BOOKS


books =  [ book1, book2, book3, book4, book5, book6 ]
libraries =  [ user1.libraries.first, user2.libraries.first ]
conditions = [ "Very used", "Used", "Good condition", "Great condition", "New"]

15.times do
  LibraryBook.create( { library_id: libraries.sample.id, book_id: books.sample.id, condition: conditions.sample } )
end

p "created #{LibraryBook.count} Library_books"




# CREATE WISHLIST_BOOKS

books =  [ book1, book2, book3, book4, book5, book6 ]
wishlists =  [ user1.wishlists.first, user2.wishlists.first ]

6.times do
  WishlistBook.create( { wishlist_id: wishlists.sample.id, book_id: books.sample.id } )
end

p "created #{WishlistBook.count} Wishlist_Books"







  # Associate the Instance of the Book to A random User
  # Add a "book_condition" for each library_book



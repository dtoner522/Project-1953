# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Match.delete_all
Message.delete_all
SwapRequest.delete_all
Chatroom.delete_all
WishlistBook.delete_all
LibraryBook.delete_all
Wishlist.delete_all
Library.delete_all
User.delete_all
Book.delete_all


# CREATE USERS

user1 = User.new( {
    first_name: "Eula",
    last_name: "Gonzales",
    username: "eulag", # DELETE USERNAME
    email: "eula@eula.com",
    password: "password",
    bio: "Hello! My name is Eula and I’m looking to get out of this training enough to be able to freelance and remotely work from anywhere. I'm excited to be part of this community and meet like minded people, hear about your journey and get some advice on!",
    location: "Sagrada Familia, Barcelona"
  } )
avatar1 = URI.open('https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
user1.photo.attach(io: avatar1, filename: 'pic.png', content_type: 'image/png')
user1.save

user2 = User.new( {
    first_name: "Guillaume",
    last_name: "Lafond",
    username: "guille433",
    email: "guill@aume.fr",
    password: "password",
    bio: "French living in BCN. Love outdoors, art & design, food, triathlon. Started my career in e-commerce, then entrepreneur in Advertising Technology.",
    location: "Carrer de Verdaguer i Callís, Barcelona"
  } )
avatar2 = URI.open('https://images.unsplash.com/photo-1493106819501-66d381c466f1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
user2.photo.attach(io: avatar2, filename: 'pic.png', content_type: 'image/png')
user2.save

user3 = User.new( {
    first_name: "Daire",
    last_name: "Toner",
    username: "dairet",
    email: "daire@daire.com",
    password: "password",
    bio: "Current English Teacher (first based in South Korea, now in Barcelona) who's eager and ready to jump into the world of web development and design!",
    location: "Carrer d'En Grassot, Barcelona"
  } )
avatar3 = URI.open('https://images.unsplash.com/photo-1509460913899-515f1df34fea?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
user3.photo.attach(io: avatar3, filename: 'pic.png', content_type: 'image/png')
user3.save

user4 = User.new( {
    first_name: "Agustina",
    last_name: "Ohan",
    username: "dairet",
    email: "agus@agus.com",
    password: "password",
    bio: "I worked as a graphic designer, photographer and photo retoucher. Exited to start my path on Coding and challenge myself into new projects !",
    location: "Plaza Catalunya, Barcelona, Catalunya"
  } )
avatar4 = URI.open('https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1100&q=80')
user4.photo.attach(io: avatar4, filename: 'pic.png', content_type: 'image/png')
user4.save

p "created #{User.count} User"
p " First user, N° #{User.first.id} : #{User.first.first_name} #{User.first.last_name}"
p " Last user, N° #{User.last.id} : #{User.last.first_name} #{User.last.last_name}"


# LIBRARY & WISHLIST are created automatically FOR EACH USER

p "created #{Library.count} libraries and #{Wishlist.count} wishlists."



# CREATE BOOKS

book1 = Book.new( {isbn: '', title:'Dune', year: '1984', genre: 'science-fiction', language: 'ES',
  description: 'Dune relata la historia del planeta desértico Arrakis, única fuente de melange, la especia necesaria para el viaje interestelar y que además garantiza longevidad y poderes psíquicos.',
  author: 'Frank Herbert', page_count: '534', thumbnail_url: ''
})
img1 = URI.open('http://res.cloudinary.com/dtoner522/image/upload/9154c3gwof79dq0tamg0b930b7pv')
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


book7 = Book.new( {isbn: '', title:'Gone with the Wind', year: '1954', genre: 'science-fiction', language: 'EN',
  description: "Scarlett O'Hara, the beautiful, spoiled daughter of a well-to-do Georgia plantation owner, must use every means at her disposal to claw her way out of the poverty she finds herself in after Sherman's March to",
  author: 'Margaret Mitchell', page_count: '1999', thumbnail_url: ''
})
img7 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1551144577l/18405._SY475_.jpg')
book7.photo.attach(io: img7, filename: 'thumbnail.png', content_type: 'image/png')
book7.save


book8 = Book.new( {isbn: '', title:'Slaughtherhouse Five ', year: '1999', genre: 'politics', language: 'EN',
  description: "Selected by the Modern Library as one of the 100 best novels of all time, Slaughterhouse-Five, an American classic, is one of the world's great antiwar books. Centering on the infamous firebombing of Dresden, Billy Pilgrim's odyssey through time reflects the mythic journey of our own fractured lives as we search for meaning in what we fear most.",
  author: 'Kurt Vonnegut Jr.', page_count: '534', thumbnail_url: ''
})
img8 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1606208827l/4981._SY475_.jpg')
book8.photo.attach(io: img8, filename: 'thumbnail.png', content_type: 'image/png')
book8.save


book9 = Book.new( {isbn: '', title:'Lolita', year: '1995', genre: 'romantic', language: 'ES',
  description: "Humbert Humbert - scholar, aesthete and romantic - has fallen completely and utterly in love with Lolita Haze, his landlady's gum-snapping, silky skinned twelve-year-old daughter. Reluctantly agreeing to marry Mrs Haze just to be close to Lolita, Humbert suffers greatly in the pursuit of romance; but when Lo ",
  author: 'George Orwell', page_count: '534', thumbnail_url: ''
})
img9 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1377756377l/7604.jpg')
book9.photo.attach(io: img9, filename: 'thumbnail.png', content_type: 'image/png')
book9.save


book10 = Book.new( {isbn: '', title:'One Flew Over the Cuckoo', year: '1963', genre: 'history', language: 'EN',
  description: 'Tyrannical Nurse Ratched rules her ward in an Oregon State mental hospital with a strict and unbending routine, unopposed by her patients, who remain cowed by mind-numbing medication and the threat of electric shock therapy. But her regime is disrupted by the arrival of McMurphy – the swaggering, fun-loving trickster ',
  author: 'George Orwell', page_count: '365', thumbnail_url: ''
})
img10 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1516211014l/332613._SX318_.jpg')
book10.photo.attach(io: img10, filename: 'thumbnail.png', content_type: 'image/png')
book10.save


book11 = Book.new( {isbn: '', title:'A Clockwork Orange', year: '1986', genre: 'science-fiction', language: 'EN',
  description: "A vicious fifteen-year-old droog is the central character of this 1963 classic. In Anthony Burgess's nightmare vision of the future, where criminals take over after dark, the story is told by the central character, Alex, who talks in a brutal invented slang that brilliantly renders his and his friends' social pathology. A Clockwork Orange is a frightening fable",
  author: 'Anthony Burgess', page_count: '534', thumbnail_url: ''
})
img11 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348339306l/227463.jpg')
book11.photo.attach(io: img11, filename: 'thumbnail.png', content_type: 'image/png')
book11.save


book12 = Book.new( {isbn: '', title:"Are You There God? It's Me, Margaret", year: '2001', genre: 'comedy', language: 'EN',
  description: 'Margaret Simon, almost twelve, likes long hair, tuna fish, the smell of rain, and things that are pink. She’s just moved from New York City to Farbook, New Jersey, and is anxious to fit in with her new friends—Nancy, Gretchen, and Janie. When they form a secret club to talk about private subjects like boys, bras, and getting their first periods',
  author: 'George Orwell', page_count: '534', thumbnail_url: ''
})
img12 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388356524l/37732.jpg')
book12.photo.attach(io: img12, filename: 'thumbnail.png', content_type: 'image/png')
book12.save


book13 = Book.new( {isbn: '', title:'Watchmen', year: '2005', genre: 'History', language: 'EN',
  description: "This Hugo Award-winning graphic novel chronicles the fall from grace of a group of super-heroes plagued by all-too-human failings. Along the way, the concept of the super-hero is dissected as the heroes are stalked by an unknown assassin.",
  author: 'Alan Moore', page_count: '416', thumbnail_url: ''
})
img13 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442239711l/472331.jpg')
book13.photo.attach(io: img13, filename: 'thumbnail.png', content_type: 'image/png')
book13.save


book14 = Book.new( {isbn: '', title:'Things Fall Apart', year: '1944', genre: 'science-fiction', language: 'EN',
  description: "More than two million copies of Things Fall Apart have been sold in the United States since it was first published here in 1959. Worldwide, there are eight million copies in print in fifty different languages. This is Chinua Achebe's masterpiece and it is often compared to the great Greek tragedies, and currently sells more than one hundred thousand copies",
  author: 'Chinua Achebe', page_count: '534', thumbnail_url: ''
})
img14 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1352082529l/37781.jpg')
book14.photo.attach(io: img14, filename: 'thumbnail.png', content_type: 'image/png')
book14.save


book15 = Book.new( {isbn: '', title:'Invisible Man', year: '1986', genre: 'polar', language: 'EN',
  description: "First published in 1952 and immediately hailed as a masterpiece, Invisible Man is one of those rare novels that have changed the shape of American literature. For not only does Ralph Ellison's nightmare journey across the racial divide tell unparalleled truths about the nature of bigotry and its effects on the minds of both victims and perpetrators",
  author: 'Ralph Ellison', page_count: '581', thumbnail_url: ''
})
img15 = URI.open('https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1556482805l/16981._SY475_.jpg')
book15.photo.attach(io: img15, filename: 'thumbnail.png', content_type: 'image/png')
book15.save


book16 = Book.new( {isbn: '', title:'Kama Sutra for Dummies', year: '2010', genre: 'education', language: 'EN',
  description: "Guided by the ancient wisdom of the Kama Sutra, this lush, gorgeously illustrated guide gives couples a year's worth of awe-inspiring sex positions to breathe new life into their love-making.",
  author: 'Hiroshi Yakatonooa', page_count: '186', thumbnail_url: ''
})
img16 = URI.open('https://books.google.es/books/content?id=CJN0PQAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE701JWFFVjq7vo4n-Au4GTjinLQ-Rkx3LcafHdG3aaBfgR6Z8u2-C8M4OyGwca-OyHEIJ3HVt_4VF8rRb6BLGhektEyC1xhHheHLiQ-3pJXNunTWyWGIBpYewqhA9sgpYfXfZPsM')
book16.photo.attach(io: img16, filename: 'thumbnail.png', content_type: 'image/png')
book16.save




p "created #{Book.count} Books"
p "The last book was #{Book.last.title}, from author #{Book.last.author}. It's #{Book.last.page_count} long !"


# BOOK SEED V2
  # Find 30 isbn exact code
  # Find the book with Google Api, Get the JSON file
  # Parse JSON and create the Instance
    # "isbn" "title" "year" ("publishedDate") "genre" "language"
    # needed : description, author, page_count, thumbnail_url, google_id


# CREATE LIBRARY_BOOKS
conditions = [ "Very used", "Used", "Good condition", "Great condition", "New"]

library1 = user1.libraries.first
library2 = user2.libraries.first
library3 = user3.libraries.first
library4 = user4.libraries.first

books1 =  [ book1, book2, book3, book4, book5, book6 ]
books2 =  [ book7, book1, book9, book10, book11, book12 ]
books3 =  [ book13, book14, book15, book16, book5, book6 ]
books4 =  [ book8, book13, book3, book15, book9, book1 ]

wishlist1 = user1.wishlists.first
wishlist2 = user2.wishlists.first
wishlist3 = user3.wishlists.first
wishlist4 = user4.wishlists.first



# FOR EACH USER CREATE LIBVRARY_BOOKS + WISHLIST_BOOKS


books1.each do |book|
  LibraryBook.create( { library_id: library1.id, book_id: book.id, condition: conditions.sample } )
end

WishlistBook.create( { wishlist_id: wishlist1.id, book_id: book7.id })
WishlistBook.create( { wishlist_id: wishlist1.id, book_id: book9.id })
WishlistBook.create( { wishlist_id: wishlist1.id, book_id: book11.id })
WishlistBook.create( { wishlist_id: wishlist1.id, book_id: book14.id })



books2.each do |book|
  LibraryBook.create( { library_id: library2.id, book_id: book.id, condition: conditions.sample } )
end

WishlistBook.create( { wishlist_id: wishlist2.id, book_id: book2.id })
WishlistBook.create( { wishlist_id: wishlist2.id, book_id: book4.id })
WishlistBook.create( { wishlist_id: wishlist2.id, book_id: book16.id })
WishlistBook.create( { wishlist_id: wishlist2.id, book_id: book14.id })


books3.each do |book|
  LibraryBook.create( { library_id: library3.id, book_id: book.id, condition: conditions.sample } )
end

WishlistBook.create( { wishlist_id: wishlist3.id, book_id: book7.id })
WishlistBook.create( { wishlist_id: wishlist3.id, book_id: book13.id })
WishlistBook.create( { wishlist_id: wishlist3.id, book_id: book1.id })

books4.each do |book|
  LibraryBook.create( { library_id: library4.id, book_id: book.id, condition: conditions.sample } )
end

WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book1.id })
WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book2.id })
WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book3.id })
WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book4.id })
WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book11.id })
WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book9.id })
WishlistBook.create( { wishlist_id: wishlist4.id, book_id: book8.id })


p "Created #{LibraryBook.count} Library_books #{WishlistBook.count} Wishlist_books"

p "User #{User.last.first_name} has #{User.last.library_books.count} Library books, and #{User.last.wishlist_books.count} Wishlist Books"









# books =  [ book1, book2, book3, book4, book5, book6 ]
# wishlists =  [ user1.wishlists.first, user2.wishlists.first ]

# 6.times do
#   WishlistBook.create( { wishlist_id: wishlists.sample.id, book_id: books.sample.id } )
# end

# p "created #{WishlistBook.count} Wishlist_Books"







  # Associate the Instance of the Book to A random User
  # Add a "book_condition" for each library_book



class Match < ApplicationRecord
  belongs_to :library_book
  belongs_to :wishlist_book
end



# Instance example

#<Match:0x00007f90ac444f50
# id: 1,
# status: nil,
# library_book_id: 80,
# wishlist_book_id: 124,
# created_at: Thu, 25 Mar 2021 11:13:33 UTC +00:00,
# updated_at: Thu, 25 Mar 2021 11:13:33 UTC +00:00,
# distance: "3.45"> # Filter by Distance < X KM


### 1. Match / Single

# library_book_id.book == wishlist_book.book

# User 1 Lib_book = User 2 Wish_book
# "Dune" is in User 1 Library, and in User 2 Wishlist
    # User 2 receive a notification that "Dune" is available in User's 1 library -> send swap request
    # User 1 receive a notification to check User's 2 library and Add to Wishlist a book



### 2. Match / Double

# library_book_id#1.book == wishlist_book#1.book && library_book_id#2.book == wishlist_book#2.book

# "Dune" is in User 1 Library, and in User 2 Wishlist
  # and
# "Petit Prince" is in User 2 library, and in User 1 Wishlist

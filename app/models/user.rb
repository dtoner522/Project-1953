class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  after_create :create_library
  after_create :create_wishlist

  has_many :libraries
  has_many :library_books, through: :libraries

  has_many :wishlists
  has_many :wishlist_books, through: :wishlists

  has_many :swap_requests
  has_many :chatrooms_as_sender, foreign_key: :sender_id, class_name: "Chatroom"
  has_many :chatrooms_as_recipient, foreign_key: :recipient_id, class_name: "Chatroom"

  def chatrooms
    chatrooms_as_sender + chatrooms_as_recipient
  end

  def create_library
    Library.create(user: self)
  end

  def create_wishlist
    Wishlist.create(user: self)
  end

  def chat_notifications?
    chatrooms.select { |chatroom| chatroom.unread_messages(self).positive? }.count.positive?
  end
end

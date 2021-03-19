class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_library

  has_many :libraries
  has_many :library_books, through: :libraries
  has_many :swap_requests
  has_many :chatrooms_as_sender, foreign_key: :sender_id, class_name: "Chatroom"
  has_many :chatrooms_as_recipient, foreign_key: :recipient_id, class_name: "Chatroom"

  has_one_attached :photo

  def chatrooms
    chatrooms_as_sender + chatrooms_as_recipient
  end

  def create_library
    Library.create(user: self)
  end
end

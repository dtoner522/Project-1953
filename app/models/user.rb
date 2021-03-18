class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_library

  has_many :libraries
  has_many :library_books, through: :libraries
  has_many :swap_requests

  has_one_attached :photo

  def create_library
    Library.create(user: self)
  end
end

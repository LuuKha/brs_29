class Book < ActiveRecord::Base
  has_many :user_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :user_books

  belongs_to :category
end

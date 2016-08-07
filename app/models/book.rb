class Book < ActiveRecord::Base
  ratyrate_rateable

  has_many :user_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :user_books

  belongs_to :category

  validates :title, presence: true, uniqueness: true, length: {maximum: 140}
  validates :author, presence: true, length: {maximum: 50}
  validates :number_of_pages, presence: true, numericality: {only_integer: true}, 
    length: {maximum: 5}
  enum rating: {zero_star: 0, one_star: 1, two_star: 2, three_star: 3, 
    four_star: 4, five_star: 5}
end

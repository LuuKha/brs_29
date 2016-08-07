class User < ActiveRecord::Base
  ratyrate_rater
  
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :like_activities, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :user_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :books, through: :user_books

  has_attached_file :avatar, styles: {medium: "300x300>", 
    thumb: "100x100#"}, default_url: "/images/:style/cute.jpg"
    
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

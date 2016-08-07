class Category < ActiveRecord::Base
  has_many :books, dependent: :destroy
  accepts_nested_attributes_for :books, allow_destroy: true, 
    reject_if: :all_blank

  validates :name, presence: true, uniqueness: true, length: {maximum: 140}
end

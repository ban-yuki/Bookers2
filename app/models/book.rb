class Book < ApplicationRecord
  #has_one_attached :title, :body
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 200 }


end
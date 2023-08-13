class Book < ApplicationRecord
  has_one_attached :title, body
  belongs_to :user
end
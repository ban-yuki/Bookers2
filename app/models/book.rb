class Book < ApplicationRecord
  has_one_attached :title
  belongs_to :user
end

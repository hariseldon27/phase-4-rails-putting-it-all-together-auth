class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :instructions, presnce: true, length: { greater_than_or_equal_to: 50 }
end

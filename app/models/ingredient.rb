class Ingredient < ApplicationRecord
  belongs_to :recipe
  
  validates :name, length: {maximum: 30 }
  validates :amount, length: {maximum: 15 }
end

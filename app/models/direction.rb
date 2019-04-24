class Direction < ApplicationRecord
  belongs_to :recipe
  
  validates :step, length: {maximum: 100}
end

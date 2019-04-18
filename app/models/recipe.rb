class Recipe < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20 }
  validates :description, presence: true, length: {maximum: 100 }
  
  mount_uploader :image, ImageUploader
end
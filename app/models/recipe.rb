class Recipe < ApplicationRecord
  
  belongs_to :user
  
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  
  validates :title, presence: true, length: {maximum: 20 }
  validates :description, presence: true, length: {maximum: 100 }
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites, foreign_key: 'recipe_id', dependent: :destroy
  has_many :users, through: :favorites
end

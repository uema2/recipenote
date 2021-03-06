class Recipe < ApplicationRecord
  
  belongs_to :user
  
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  
  validates :title, presence: true, length: {maximum: 30 }
  validates :description, presence: true, length: {maximum: 255 }
  validates :image, presence: true
  validate :image_size
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites, foreign_key: 'recipe_id', dependent: :destroy
  has_many :users, through: :favorites
  
  def self.search(search)
    if search
      where(['title LIKE ? OR description LIKE?', "%#{search}%", "%#{search}%"])
    else
      all
    end
  end
  
  def image_size
    if image.size > 5 .megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end

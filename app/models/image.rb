class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :similar_images, dependent: :destroy

  validates :title, presence: true, length: {in: 3..20 }
  validates :image, presence: true
end

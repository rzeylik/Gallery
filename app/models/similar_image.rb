class SimilarImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :image

  validates :title, presence: true, length: {in: 3..20 }
  validates :image, presence: true

  validates_with SimilarImageValidator
end

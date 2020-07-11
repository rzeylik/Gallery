class Category < ApplicationRecord
  has_many :images, dependent: :destroy

  validates :title, presence: true, length: {in: 3..20 }
end

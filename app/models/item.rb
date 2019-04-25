class Item < ApplicationRecord
  mount_uploader :pics, ImageUploader
  
  belongs_to :company
  has_many :purchases
  
  validates :name, presence: true, length: {maximum: 255}
  validates :price, presence: true
  validates :unit, presence: true
  validates :pics, presence: true
end

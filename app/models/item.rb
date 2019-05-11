class Item < ApplicationRecord
  mount_uploader :pics, ImageUploader
  
  belongs_to :company
  has_many :purchases, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 255}
  validates :unit_price, presence: true
  validates :unit, presence: true
  validates :pics, presence: true
  
  def self.search(search)
    return Item.all unless search
    Item.where(['explanation LIKE ?', "%#{search}%"])
  end
  
end
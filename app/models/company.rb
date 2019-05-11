class Company < ApplicationRecord
  
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy
  
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true,
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :company_name, presence: true
  validates :representative, presence: true
  validates :country, presence: true
  validates :zip, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :other_address, presence: true
  validates :phone_num, presence: true
  validates :business_content, presence: true
end
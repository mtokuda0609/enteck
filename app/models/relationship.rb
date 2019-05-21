class Relationship < ApplicationRecord
  belongs_to :company
  belongs_to :friend, class_name: 'Company'
  has_many :chats
end

class Purchase < ApplicationRecord
  belongs_to :company
  belongs_to :item

end
class PurchasedProduct < ApplicationRecord
  belongs_to :purchase
  belongs_to :registered_product
  validates :kilogram, presence: true
end

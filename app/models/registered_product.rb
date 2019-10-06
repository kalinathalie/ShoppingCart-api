class RegisteredProduct < ApplicationRecord
  validates :name, :prize, presence: true
  has_many :purchased_products
  has_many :purchases, :through => :purchased_products
end

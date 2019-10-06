class Coupon < ApplicationRecord
  enum kind: [:percentual, :fixed, :free_shipping]
  validates :code, :value, :kind, presence: true
  belongs_to :purchase, optional: true
end

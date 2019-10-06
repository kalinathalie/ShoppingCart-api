class Purchase < ApplicationRecord
  has_many :purchased_products
  has_many :registered_products, :through => :purchased_products
  validates :token, presence: true

  #For purchases above R$400.00 the shipping is free!
  #For purchases bellow or equal 10kg the shipping price is: $30.
  #Each 5kg above 10kg will add $7 to the shipping price.
  def shipping
    result = 0
    unless subtotal > 400
      weight = purchased_products.pluck(:kilogram).inject(0){|sum,x| sum + x }
      result = (weight <= 10 ? 30 : 30 + 7*((weight-5)/5))
    end
    result
  end

  #Run each Registered Product and multiply your prize with the selected kilogram
  def subtotal
    result = 0
    purchased_products.each do |p|
      result += p.kilogram * RegisteredProduct.find(p.registered_product_id).prize
    end
    result
  end

  #Percentual coupon: are coupons that reduce an amount in percentage of the cost on subtotal.
  #Fixed coupon: are coupons with fixed amounts that should reduce over the TOTAL.
  #Free Shipping: make shipping price being 0 when applied that coupons has as minimum value
  def calculate_coupon
    result = 0
    unless coupon.nil?
      case coupon.kind
      when 0
        result = (subtotal/100) * coupon.value
      when 1
        result = coupon.value
      when 2
        result = shipping if subtotal >= coupon.value
      end
    end
    result
  end

  def total
    subtotal - calculate_coupon + shipping
  end

  def coupon
    Coupon.find_by(purchase_id: self[:id])
  end

  def purchased_products
    PurchasedProduct.where(purchase_id: self[:id])
  end
end

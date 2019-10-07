class PurchasesController < ApplicationController
  before_action :set_purchase
  before_action :set_product, only: [:update_cart]
  before_action :set_coupon, only: [:add_coupon]

  # POST /cart/update
  def update_cart
    product = PurchasedProduct.find_or_create_by(
      purchase_id: @purchase.id,
      registered_product_id: @registered_product.id
    )
    product.update(kilogram: params[:kilogram])
    if product.save!
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # POST /cart/add_coupon
  def add_coupon
    if @coupon.update(purchase_id: @purchase.id)
      render json: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # POST /cart/finish
  def finish
    result = {
      coupon: @purchase.coupon,
      subtotal: @purchase.subtotal,
      total: @purchase.total,
      shipping: @purchase.shipping
    }
    render json: @purchase.purchased_products.index_by(&:id).merge(result)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find_by(token: params[:token])
    end

    def set_product
      @registered_product = RegisteredProduct.find_by(name: params[:name])
    end

    def set_coupon
      @coupon = Coupon.find_by(code: params[:code])
    end
end

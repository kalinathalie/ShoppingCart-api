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
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  # POST /cart/add_coupon
  def add_coupon
    if @coupon.update(purchase_id: @purchase.id)
      render json: @coupon
    else
      render json: @purchase.errors, status: :unprocessable_entity
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
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params.fetch(:purchase, {})
    end
end

class CartedProduct < ApplicationRecord
belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  def subtotal
    quantity * product.price
  end

end


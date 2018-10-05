class Api::CartedProductsController < ApplicationController
before_action :authenticate_user

  def index
    @carted_products = current_user.cart
    render "index.json.jbuilder"
  end

  def create

    @carted_product = CartedProduct.new(
                                        product_id: params[:product_id],
                                        quantity: params[:quantity], 
                                        user_id: current_user.id, 
                                        status: "carted"
                                        )
    if @carted_product.save
      render "show.json.jbuilder"
    else render json: {message: @carted_product.errors.full_messages}
    end

  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")
    render json: {status: "Product was removed from cart"}  
  end

end


class Api::OrdersController < ApplicationController
before_action :authenticate_user, only: [:index, :create]

  def index

    @orders = current_user.orders
    render 'index.json.jbuilder'

  end

  def create

    @order = Order.new(user_id: current_user.id)

    carted_products = current_user.cart

    @order.build_totals
    @order.save

    carted_products.update_all(status: "purchased", order_id: @order.id)

    render "show.json.jbuilder"

  end

end

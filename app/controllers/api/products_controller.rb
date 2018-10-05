class Api::ProductsController < ApplicationController
# before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search]

    category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @products = category.products
    end

    if search_term
      @products = @products.where("description iLIKE ?", "%#{search_term}%")
    end

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    end

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          description: params[:description],
                          stock: params[:stock],
                          supplier_id: params[:supplier_id]
                          )

    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    @product.stock = params[:stock] || @product.stock
    
    if @product.save
      render "show.json.jbuilder"
    elsif
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Cloud successfully destroyed."}
  end

end

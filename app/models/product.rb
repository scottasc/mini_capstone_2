class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true

  # validates :description, presence: true
  # validates :description, length: { in: 1..200 }

  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  belongs_to :supplier
  
  has_many :carted_products
  has_many :orders, through: :carted_products

  has_many :images
  
  has_many :product_categories
  has_many :categories, through: :product_categories

  # def categories
  #   product_categories.map { |product_category| product_category.category }
  # end

  def is_discounted?
    price < 100 #statements like this (<, >, ==, <=, >=, etc.) return a boolean. It's a convention to end the method with a question mark.
    # if price < 100 
        # return true
    # else
        # return false
    # end
  end

  def tax
    price * 0.09
  end

  def total
    total = price + tax
  end

end

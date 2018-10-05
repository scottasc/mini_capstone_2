class Order < ApplicationRecord
  belongs_to :user
  belongs_to :carted_products
  has_many :products, through: :carted_products

  # def calculate_subtotal
  #   self.subtotal = product.price * quantity
  # end

  # def calculate_tax
  #   self.tax = subtotal * 0.09
  # end

  # def calculate_total
  #   self.total = subtotal + tax
  # end

  # def build_totals
  #   calculate_subtotal
  #   calculate_tax
  #   calculate_total
  # end

  def calculate_subtotal
    sum = 0
    cart.each do |carted_product|
      sum += carted_product.subtotal
    end
    self.subtotal = sum
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def build_totals
    calculate_subtotal
    calculate_tax
    calculate_total
  end

end

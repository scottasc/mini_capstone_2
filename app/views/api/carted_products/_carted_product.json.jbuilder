json.id carted_product.id
json.order_id carted_product.order_id
json.status carted_product.status
json.quantity carted_product.quantity
json.product do
  json.partial! carted_product.product, partial: "api/products/product", as: :product
end
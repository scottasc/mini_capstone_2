json.id product.id
json.name product.name
json.description product.description
json.stock product.stock
json.price product.price
json.tax product.tax
json.supplier_id product.supplier_id
json.total product.total
json.discounted product.is_discounted? 
  if product.is_discounted?
    json.sale_message "Discounted price"
  end
  
json.formatted do 
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end

json.supplier do
  json.partial! product.supplier, partial: 'api/suppliers/supplier', as: :supplier
end

json.image do
  json.array! product.images, partial: 'api/images/image', as: :image
end

json.current_user current_user


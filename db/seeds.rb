Product.destroy_all
12.times do |i|
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price.to_i,
    photo: "http://lorempixel.com/400/400/technics/#{i+1}"
  )
end
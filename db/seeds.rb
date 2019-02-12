Product.destroy_all
12.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price.to_i,
    photo: "https://picsum.photos/400/400/?image=#{rand(1..50)}"
  )
end
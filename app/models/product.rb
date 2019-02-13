class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders

  has_many :wishlists, dependent: :destroy
  has_many :users, through: :wishlists
end

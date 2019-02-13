class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :products, through: :orders

  has_many :wishlists, dependent: :destroy
  has_many :products, through: :wishlists

  def cart
    orders.where(paid: false)
  end

end

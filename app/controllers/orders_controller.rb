class OrdersController < ApplicationController

  def create
    order = Order.new(
      product_id: params[:product_id],
      user: current_user
    )
    order.save
    redirect_to products_path, notice: 'Producto agregado al carro!'
  end

  def cart
    @orders = current_user.orders
  end
  
  
end

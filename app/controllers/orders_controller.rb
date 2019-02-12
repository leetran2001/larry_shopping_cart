class OrdersController < ApplicationController

  def create
    @order = Order.find_or_initialize_by(
      product_id: params[:product_id],
      user: current_user,
      paid: false
    )
    @order.quantity += 1
    @order.price = @order.product.price
    @order.save
    redirect_to cart_orders_path, notice: 'Producto agregado al carro!'
  end

  def cart
    @orders = current_user.cart
    @total = @orders.map { |order| order.product.price * order.quantity }.sum
  end

  def empty_cart
    @orders = current_user.cart
    @orders.destroy_all
    redirect_to cart_orders_path, notice: 'Carro vaciado con éxito!'
  end

  def remove_one_item
    @order = Order.find(params[:order_id])
    @order.quantity -= 1 if @order.quantity > 1
    @order.save if @order.changed?
    redirect_to cart_orders_path, notice: 'Cantidad modificada con éxito!'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to cart_orders_path, notice: 'Producto eliminado del carro'
  end
  
end

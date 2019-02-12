class OrdersController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find_or_initialize_by(product: @product, user: current_user, paid: false)
    @order.quantity += 1
    @order.save
    redirect_to products_path, notice: 'Producto agregado al carro!'

    # @order = Order.find_by(product: @product, user: current_user, paid: false)
    # @order = Order.new(product: @product, user: current_user, paid: false) unless @order.present?
  end

  def cart
    # Refactor
    @orders = current_user.orders.where(paid: false)
    @total = @orders.inject(0) { |sum, order| sum + order.product.price * order.quantity }
  end
  
end

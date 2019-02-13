class WishlistsController < ApplicationController

  def create
    wishlist = Wishlist.new(
      user: current_user,
      product_id: params[:product_id]
    )
    wishlist.save
    redirect_to root_path, notice: 'TIENEZ UN NUEVO PRODUCTO EN EL WIZLIZT'
  end

  def index
    @wishlists = current_user.wishlists
  end

end

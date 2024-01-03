class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
  end
  
  def create
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      @cart_items = CartItem.all
      render :index
    end
  end
  
  def destroy
    @cart_item = CartItem.find(prams[:id])
    @cart_item.destroy
    redirect_to request.referer
  end
  
  def destroy_all
    
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end

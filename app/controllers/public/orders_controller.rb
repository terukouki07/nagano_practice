class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @addresses = Address.all
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.save
  end

  def create
    @order = Order.new(order_params)
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :address, :name, :postal_code, :shipping_cost, :total_payment, :payment_method, :status)
  end
end

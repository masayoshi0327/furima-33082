class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

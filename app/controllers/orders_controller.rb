class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

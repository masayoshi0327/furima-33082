class OrdersController < ApplicationController
  before_action :move_to_signed_in, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :correct_user, only: [:index, :create]
  before_action :sold_out?, only: [:index]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def move_to_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out?
    unless @item.order.blank?
      redirect_to root_path
    end
  end
end

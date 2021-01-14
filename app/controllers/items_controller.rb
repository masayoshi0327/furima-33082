class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: [:new, :create, :edit, :update]
  before_action :item_find, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    correct_user?
  end

  def update
    correct_user?
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def move_to_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_fee_id, :sender_id,
                                 :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def correct_user?
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end

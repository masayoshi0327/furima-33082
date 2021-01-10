class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: :new
  
  def index
  end

  def new
  end
  
  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

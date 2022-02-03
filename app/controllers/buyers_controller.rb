class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user != current_user.id && @item.buyer.blank?
      @order = Order.new
    else
      redirect_to root_path
    end
  end


  def create
    binding.pry
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
  def set_item
    @item = Item.find(params[:item])
  end

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone).merge(
      user_id: current_user.id, item_id: params[:item], token: params[:token]
    )
  end





end


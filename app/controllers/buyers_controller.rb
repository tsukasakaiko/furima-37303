class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user_id != current_user.id && @item.buyer.blank?
      @item_address = SendingAddress.new
    else
      redirect_to root_path
    end
  end


  def create
    @sending_address = SendingAddress.new(item_address_params)
    if @sending_address.valid?
      pay_item
      @sending_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_address_params
    params.require(:item_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end





end


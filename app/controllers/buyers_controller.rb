class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user_id != current_user.id && @item.buyer.blank?
      @sending_address = SendingAddress.new
    else
      redirect_to root_path
    end
  end


  def create
    @sending_address = SendingAddress.new(sending_address_params)
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






end


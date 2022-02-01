class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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
end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_charge_id, :prefecture_id, :estimated_day_id, :item_info,
                                 :item_name, :image, :price).merge(user_id: current_user.id)
  end

  

class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user.id != current_user.id && @item.buyers.blank?
      @sendding_address = SenddingAddress.new
    else
      redirect_to root_path
    end
  end

  def new
  end

end

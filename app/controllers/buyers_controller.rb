class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index

  end

  def new
  end

end


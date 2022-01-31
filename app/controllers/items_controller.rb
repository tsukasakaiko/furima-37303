class ItemsController < ApplicationController
  before_action :authenticate_user! ,only:[:new]
 
  def index
  end

  def new
  end

  def image_params
    params.imerge(user_id: current_user.id)
  end


end





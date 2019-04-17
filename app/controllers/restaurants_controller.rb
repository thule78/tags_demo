class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!

  def tagged
    if params[:tag].presents?
      @restaurants = Restaurant.tagged_with(params[:tag])
    else
      @restaurants = Restaurant.all
    end
  end

  def restaurant_params
    params.require(:restaurants).permit(:name, :description, tag_list: [])
  end

end

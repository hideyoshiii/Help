class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
  	@current_user = current_user

    @like = Like.new(user_id: @current_user.id, listing_id: params[:listing_id])
    @like.save
    redirect_to("/listings/#{params[:listing_id]}")  
  end

  def destroy
  	@current_user = current_user

    @like = Like.find_by(user_id: @current_user.id, listing_id: params[:listing_id])
    @like.destroy
    redirect_to("/listings/#{params[:listing_id]}")
  end

end

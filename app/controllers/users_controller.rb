class UsersController < ApplicationController
  def show 
  	@user = User.find(params[:id]) #Userモデルから、userを探してきた。
    
    @reviews = Review.where(reviewed_user_id: @user.id) 
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

end

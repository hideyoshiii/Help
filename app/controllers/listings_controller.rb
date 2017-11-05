class ListingsController < ApplicationController
  before_action :authenticate_user!


  def index
    @listings = current_user.listings
  end

  def show
    @current_user = current_user
    @listing = Listing.find(params[:id])
    @likes_count = Like.where(listing_id: @listing.id).count
  end

  def new
    # 現在のユーザーのリスティングの作成
    @listing = current_user.listings.build
  end

  def create
    # パラメーターとともに現在のユーザーのリスティングを作成
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to root_path, notice: "Helpを出しました"
    else
      redirect_to new_listing_path, notice: "Helpを出せませんでした"
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    if !(current_user == @listing.user)
      redirect_to root_path, notice: "他人の編集ページにはアクセスできません"
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to edit_listing_path(@listing), notice: "更新しました"
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :category, :content, :area, :format, :budget, :deadline, :active)
  end

end

class ReviewsController < ApplicationController
  def create
    @balance =  params[:review][:balance]

    @review = current_user.reviews.create(review_params)

    @user = User.find_by(id: @review.reviewed_user_id)
    @naw = @user.balance
    @user.balance = @balance.to_i + @naw
    @user.save

    @notification = Notification.new(user_id: @review.reviewed_user_id, content: "あなたに謝礼金が支払われました", read: false)
    @notification.save

    redirect_to root_path, notice:"相手へのレビューと支払いが完了しました"
  end

  def new
    @approval = Approval.find(params[:approval_id])
    @user = current_user

  end

  
  private
    def review_params
      params.require(:review).permit(:description, :rate, :approval_id, :reviewed_user_id)       
    end
end

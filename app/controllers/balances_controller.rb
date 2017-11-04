class BalancesController < ApplicationController
  def index
    @balance = current_user.balance

    @payouts = Payout.where(user_id: current_user.id).all.reverse_order
  end

  def new
  end

  def create
    @user = User.find_by(id: current_user.id)
    @balance = @user.balance

    if @balance.to_i >= params[:post][:amount].to_i

      @payout = current_user.payouts.create(amount: params[:post][:amount], transfer: params[:post][:transfer])
      redirect_to balance_path, notice:"出金の申請が完了しました"

      @balance = @balance - @payout.amount
      @user.update(balance: @balance)

    else
      redirect_to balance_path, notice:"出金申請が売上残高よりも大きかったため出金の申請が完了しませんでした"

    end




  end

  def account
    @user = current_user
  end

  def connect
    @user = User.find_by(id: current_user.id)
    @user.update(bank_name: params[:post][:bank_name], branch_name: params[:post][:branch_name], account_types: params[:post][:account_types], account_number: params[:post][:account_number], account_holder: params[:post][:account_holder])
    redirect_to balance_path, notice:"口座の登録が完了しました"
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(bank_name: params[:post][:bank_name], branch_name: params[:post][:branch_name], account_types: params[:post][:account_types], account_number: params[:post][:account_number], account_holder: params[:post][:account_holder])
    redirect_to balance_path, notice:"口座の登録が完了しました"
  end
    

  
end

class ApprovalsController < ApplicationController

  def create
  	@approval = current_user.approvals.create(approval_params)
  	redirect_to conversations_path(sender_id: current_user.id, recipient_id: @approval.proposal.user.id), notice:"承認しました、メッセージを送って詳細を決めましょう"
  end

  def index
  	@approvals = current_user.approvals
  end

  def approved
  	@proposals = current_user.proposals
  end

  private
  def approval_params
  	params.require(:approval).permit(:proposal_content, :proposal_price, :proposal_id)
  end

end
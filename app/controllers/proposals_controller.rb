class ProposalsController < ApplicationController

	def new
		@listing = Listing.find(params[:listing_id])
	end

	def edit
		@proposal = Proposal.find(params[:id])
		if !(current_user == @proposal.user)
      redirect_to root_path, notice: "他人の編集ページにはアクセスできません"
    end
	end

	def show
		@proposal = Proposal.find(params[:id])
	end

	def index
		@proposals = current_user.proposals
	end

	def proposaled
		@listings = current_user.listings
	end

  def create
  	@proposal = current_user.proposals.create(proposal_params)

  	redirect_to @proposal.listing, notice:"提案しました"
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update(proposal_params)
      redirect_to edit_proposal_path(@proposal), notice: "更新しました"
    end
  end

  private 
  	def proposal_params
  		params.require(:proposal).permit(:proposal_content, :proposal_price, :listing_id)
  	end

end
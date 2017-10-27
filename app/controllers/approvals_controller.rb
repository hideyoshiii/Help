class ApprovalsController < ApplicationController

  def create

     
      # Charge 
      amount = params[:approval][:proposal_price]

    
      # Calculate the fee amount that goes to the application.
      # docs https://stripe.com/docs/connect/payments-fees
      begin
        charge_attrs = {
          amount: amount,
          currency: "jpy",
          source: params[:token],
          description: "Test Charge via Stripe Connect",
        }

        # Use the platform's access token, and specify the
        # connected account's user id as the destination so that
        # the charge is transferred to their account.
        
        
        charge = Stripe::Charge.create( charge_attrs )

        #have to edit view template to show html in flash
        flash[:notice] = "Charged successfully!"

      rescue Stripe::CardError => e
        error = e.json_body[:error][:message]
        flash[:error] = "Charge failed! #{error}"
      end



  	@approval = current_user.approvals.create(approval_params)
  	redirect_to conversations_path(sender_id: current_user.id, recipient_id: @approval.proposal.user.id), notice:"承認しました、メッセージを送って詳細を決めましょう"

    @solution = Listing.find_by(id: @approval.proposal.listing_id)
    @solution.solution = true
    @solution.save

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
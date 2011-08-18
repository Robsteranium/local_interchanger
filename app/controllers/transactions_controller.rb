class TransactionsController < ApplicationController

  def show
    # only visible by parties involved?
    @transaction = Transaction.find(params[:id])
  end

  def initiate_trade
    #create transaction
    #advise buyer/ seller
    @transaction = Transaction.new(params[:transaction_data])
    if @transaction.save
      redirect_to @transaction, :notice => "Successfully initiated trade."
    else
      redirect_back :notice => "Couldn't initiate trade."
    end
  end
  
  def set_value
    # can't do for confirmed or cancelled
    # changing for agreed will reset them back to unagreed
    # ok for disputed
    @transaction = Transaction.find(params[:id])
    if @transaction.confirmed != true && @transaction.agreed != false
      @transaction.agreed = nil
      @transaction.value = params[:value]
      @transaction.save
    else
      redirect_back :notice => "You can't change the value of a cancelled or completed transaction."
    end
    render :text => @transaction.value
  end

  def agree_trade
    @transaction = Transaction.find(params[:id])
    @transaction.agreed = true #mark trade as agreed
    #advise seller/ buyer
    @transaction.save!
    redirect_to show
  end

  def confirm_transfer
    @transaction = Transaction.find(params[:id])
    @transaction.confirmed = true #mark trade as confirmed
    #advise seller/ buyer
    @transaction.save! #transfer of currency handled by user balance
    redirect_to show        
  end

  def cancel_trade
    @transaction = Transaction.find(params[:id])
    @transaction.agreed = false #mark trade as agreed
    #advise seller/ buyer
    @transaction.save!
    redirect_to show
  end

  def dispute_transation
    @transaction = Transaction.find(params[:id])
    @transaction.confirmed = false #mark trade as agreed
    #advise seller/ buyer
    @transaction.save!
    redirect_to show
  end

  def rate_product
  end

#  def index
#  end

# admin?

end

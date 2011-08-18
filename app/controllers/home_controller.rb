class HomeController < ApplicationController

  # recent transactions
  # highest trading user/ product

  def index
    @trades = Transaction.last(5)
    # render the landing page
  end
  
  def show
    render :action => params[:page]
  end

  def searchResults
    @queryterm = params[:searchtext]
    begin
      @users = User.where("username like ?", "%#{@queryterm}%")
      @products = Product.where("title like ?", "%#{@queryterm}%")
      #matching_products = Product.where("title like ?", "%#{@queryterm}%").collect {|up| up.userproducts}.flatten.uniq
      #@offers = (Userproduct.offer.to_a & matching_products).uniq
      #@requests = (Userproduct.request.to_a & matching_products).uniq
   rescue
     logger.info "RecordNotFound"
   end
     render(:layout => false)
  end
 
end

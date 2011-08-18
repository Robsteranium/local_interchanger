class UsersController < ApplicationController

  def weird
    render :text => "Current User: #{current_user.username}, @current_user: #{@current_user.username}"
  end

  def my_balance
    require_user
    @user = current_user
#@user = User.find_by_id(current_user.id)
    # @user = User.first
  end

  def my_offers
    require_user
    @user = current_user
    @user.products.build
    #logger.info @user.offers.count
  end

  def my_requests
    require_user
    @user = current_user
    @user.products.build
  end

  def my_transactions
    require_user
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
#    @user.roles << Role.find_by_name('registered')
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default users_url
    else
      render :action => :new
    end
  end
    
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to users_url
    else
      render :action => :edit
    end
  end

  def show
    @user = User.find(params[:id])    
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end

class ProductsController < ApplicationController

  def all_offers
    @products = Product.all
  end

  def all_requests
    #@requested_products = Userproduct.request
    # ought to be request terms... and in another controller...
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def index
    @products = Product.all
  end

end

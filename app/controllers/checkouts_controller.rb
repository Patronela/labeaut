class CheckoutsController < ApplicationController
  def new
	@checkout = Checkout.new
  end 
  def index
   @checkout = Checkout.all
  end
  def create
	@checkout = Checkout.new(checkout_params)
	if !params["card"].nil? and  !params["id_no"].nil?
		Cart.all.each do |cart|
			cart.update(:user => params[:user])
		end
		redirect_to root_path+"cart"
	end
  end
  def show
    @checkout = Checkout.find(params[:id])
  end
  def checkout_params
		params.require(:checkouts).permit(:user, :amount)
  end
end


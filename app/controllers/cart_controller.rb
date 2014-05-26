class CartController < ApplicationController
  def new
    @cart = Cart.new
  end
  def index
	if !params["item"].nil?
		@cart = Cart.new(cart_params)
		@cart.save
	end
	if !params["minus"].nil?
	    @cart = Cart.find(params["minus"])
        @cart.destroy
	end
	session[:total] = 0; 
    @cart = Cart.all
  end
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart
    else
      render 'new'
    end
  end
  def show
    @cart = Cart.find(params[:id])
  end
  def cart_params
		item = params['item'].to_i
		params = ActionController::Parameters.new({ cart: { user: session[:current_user_id] , item: item , status: "oncart"}})
		params.require(:cart).permit(:user, :item, :status)
  end
end

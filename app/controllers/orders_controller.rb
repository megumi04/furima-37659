class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orders_address = OrdersAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @orders_address = OrdersAddress.new(orders_params)
    if @orders_address.valid?
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def orders_params
    params.require(:orders_address).permit(:post_code, :state_id, :city, :address, :house_number, :phone).merge(user_id: current_user.id)
  end
end
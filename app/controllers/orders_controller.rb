class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!


  def index
    @orders_address = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def create
    @orders_address = OrderAddress.new(orders_params)
    if @orders_address.valid?
      pay_item
      @orders_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end


  def orders_params
    params.require(:order_address).permit(:post_code, :state_id, :city, :address, :house_number, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: orders_params[:token],
      currency: 'jpy'
    )
  end
end

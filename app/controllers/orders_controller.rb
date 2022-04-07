class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @orders_address = OrderAddress.new
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path 
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @orders_address = OrderAddress.new(orders_params)
    if @orders_address.valid?
      pay_item
      @orders_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private

  def orders_params
    params.require(:order_address).permit(:post_code, :state_id, :city, :address, :house_number, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: orders_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

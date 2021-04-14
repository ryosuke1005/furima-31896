class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = UserOrder.new
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :token, :name, :postal_code, :prefecture, :city, :house_number, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

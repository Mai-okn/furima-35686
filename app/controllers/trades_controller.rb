class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]
  before_action :user_confirm, only: [:index,:create]


  def index
    @trade_address = TradeAddress.new
  end

  def create
    @trade_address = TradeAddress.new(trade_params)
    if @trade_address.valid? 
      pay_item
      @trade_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  
  def trade_params
    params.require(:trade_address).permit(:postal_code, :prefectured_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: trade_params[:token], 
      currency: 'jpy'
    )
  end

  def sold_out_item
    if @item.trade.present?
      redirect_to root_path 
    end
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def user_confirm
    if current_user.id == @item.user_id 
      redirect_to root_path 
    end
  end
  
end

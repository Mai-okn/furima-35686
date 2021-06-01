class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item

  def index
    @trade_address = TradeAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @trade_address = TradeAddress.new(trade_params)
    @item = Item.find(params[:item_id])
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
    @item = Item.find(params[:item_id])
    if @item.trade.present? || current_user.id == @item.user_id 
      redirect_to root_path 
    end
  end

  
end

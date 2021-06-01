class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_confirm, only: [:edit, :destroy, :update]
  before_action :sold_out_item, only:[:edit,:update]

  def index
    @items = Item.all.order(created_at: :desc)
    
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if user_confirm
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if user_confirm && @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if user_confirm && @item.destroy
      redirect_to root_path
      else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:status_id,:delivery_charge_id,:delivery_day_id,:prefectured_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_confirm
    @item.user_id  ==  current_user.id
  end

  def sold_out_item
    if @item.trade.present? || current_user.id == @item.user_id 
      redirect_to root_path 
    end
  end
  
end

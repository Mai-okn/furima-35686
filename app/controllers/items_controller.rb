class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]


  def index
  end


  def new
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:status_id,
    :delivery_charge_id,:delivery_day_id,:prefectured_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

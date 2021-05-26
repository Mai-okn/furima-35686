class ItemsController < ApplicationController
  def index
  end


  private

  def item_params
    params.require(:item).permit(:name,:image,:description,:price,:category_id,:status_id,
    :delivery_charge_id,:delivery_day_id,:prefectured_id).merge(user_id: current_user.id)
  end
end

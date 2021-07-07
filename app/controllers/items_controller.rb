class ItemsController < ApplicationController

  def index
     @item = Item.new
  end

  def new
    @item = Item.new
  end
  private
  def item_params
    params.require(:item).permit(:name,:info,:category_id,:appearance_id,:delivery_date_id,:delivery_local_id,:delivery_style_id,:price).merge(user_id: current.user.id)
  end
end

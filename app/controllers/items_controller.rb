class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(id: "DESC")
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
  private
  def item_params
    params.require(:item).permit(:image,:name,:info,:category_id,:appearance_id,:delivery_date_id,:delivery_local_id,:delivery_style_id,:price).merge(user_id: current_user.id)
  end
end

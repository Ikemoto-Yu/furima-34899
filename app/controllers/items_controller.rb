class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_params_id, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_index_nil_item, only: [:edit]


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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end
  
  private

  def item_params_id
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image,:name,:info,:category_id,:appearance_id,:delivery_date_id,:delivery_local_id,:delivery_style_id,:price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user.id == current_user.id 
      redirect_to action: :index
    end
  end

  def move_to_index_nil_item
    unless  @item.purchase_admin.nil?
      redirect_to action: :index
    end
  end
end

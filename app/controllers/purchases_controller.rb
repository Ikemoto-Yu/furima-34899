class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :params_itemid, only: [:index , :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_admin = PurchaseAdmin.find(params[:item_id])
    @item = Item.find(params[:item_id])
    @purchase_purchase_admin = PurchasePurchaseAdmin.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_purchase_admin = PurchasePurchaseAdmin.new(purchase_params)
    if @purchase_purchase_admin.valid?
      pay_item
      @purchase_purchase_admin.save
      redirect_to root_path
    else
      render   'index'
    end
  end

  private

  def params_itemid
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_purchase_admin).permit(:phone_number,:building_name,:local_address,:local_position_town,:delivery_local_id,:post_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5d3c5b184d859d819d810f54"
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    unless @item.user.id == current_user.id && @item.purchase_admin.nil?
      redirect_to root_path
    end
  end

end

class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:phone_number,:building_name,:local_address,:local_position_town,:delivery_local_id,:post_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5d3c5b184d859d819d810f54"
      Payjp::Charge.create(
        amount: purchase_params[:price],  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

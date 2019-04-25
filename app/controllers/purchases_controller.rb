class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all.where(company_id: current_user.id).page(params[:page])
  end
  
  
  def show
    @purchase = Purchase.find(params[:id])
  end


  def create
    item = Item.find(purchase_params["item_id"])
    @purchase = current_user.purchases.build(purchase_information)
    if @purchase.save
      flash[:success] = "商品を購入しました"
      redirect_to item
    else
      flash[:danger] = "商品を購入できませんでした"
      render item
    end
  end



  private
  
  def purchase_params
    params.require(:purchase).permit(:quantity, :item_id)
  end

  def set_extra_information
    unit_price = Item.find(purchase_params["item_id"]).unit_price.to_i
    quantity = purchase_params["quantity"].to_i
    price = (quantity * unit_price).to_s
    {:price => price}
  end

  def purchase_information
    purchase_params.merge(set_extra_information)
  end
  
end
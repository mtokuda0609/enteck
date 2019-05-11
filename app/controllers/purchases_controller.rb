class PurchasesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :create, :confirm]
  
  def index
    @purchases = Purchase.where(company_id: current_user.id).page(params[:page])
  end
  
  
  def show
    @purchase = Purchase.find(params[:id])
    @item = Item.find(@purchase.item_id)
    @company = Company.find(@item.company_id)
  end

  def confirm
    @item = Item.find(purchase_params["item_id"])
    @purchase = current_user.purchases.build(purchase_information)
    render @item if @purchase.invalid?
  end

  def create
    @item = Item.find(purchase_params["item_id"])
    @purchase = current_user.purchases.build(purchase_information)
    respond_to do |f|
      if params[:back]
        f.html {render 'items/show'}
      elsif @purchase.save
        flash[:success] = "商品を購入しました"
        f.html {redirect_to @purchase}
      else
        flash[:danger] = "商品を購入できませんでした"
        f.html {render 'items/show'}
      end
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
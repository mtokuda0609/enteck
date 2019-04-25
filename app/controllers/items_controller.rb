class ItemsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @items = Item.all.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
    @purchase = current_user.purchases.build
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.item.new(item_params)
    if @item.save
      flash[:success] = "商品が登録されました"
      redirect_to @item
    else
      flash[:danger] = "商品登録ができませんでした"
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      flash[:success] = "商品情報を更新しました"
      redirect_to @item
    else
      flash[:danger] = "商品情報を更新できませんでした"
      render :edite
    end
  end
  
  def destroy
    #binding.pry
    @item = find_item_by_id
    @item.destroy
    flash[:success] = "商品を削除しました"
    redirect_to root_path
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :amount_unit, :minimum_lot, :unit, :pics)
  end
  
  def find_item_by_id
    Item.find(params[:id])
  end
  
end

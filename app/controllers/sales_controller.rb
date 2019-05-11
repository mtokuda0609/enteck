class SalesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @items = Item.where(company_id: current_user.id)                        #自分の出品したアイテム一覧
    @sales = Purchase.where(item_id: @items.each do |item| item.id end)     #自分の出したアイテムを購買一覧から抽出
    filename = "sales_" + Time.zone.now.strftime("%Y%m%d%H%M").to_s
    
    respond_to do |format|
      format.html do
        #html用の処理を書く
      end 
      format.csv do
        send_data render_to_string, filename: filename, type: 'text/csv; charset=shift_jis'
      end
    end
    
  end

  def show
  end
end

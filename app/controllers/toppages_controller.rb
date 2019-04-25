class ToppagesController < ApplicationController
  def index
    @items = Item.all.order('created_at desc').page(params[:page])
  end
end

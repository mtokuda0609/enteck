class CompaniesController < ApplicationController

  def index
    @companies = Company.all.page(params[:page])
  end

  def show
    @company = Company.find(params[:id])
    @items = Item.where(company_id: @company).page(params[:page])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "ユーザ登録しました"
      redirect_to @company
    else
      flash[:danger] = "ユーザ登録できませんでした"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :company_name, :representative, :capital, :sales, :employee, :url, :country, :zip, :state, :city, :other_address, :phone_num, :business_content, :main_item, :appeal_point)
  end
  
  def company_id
    Company.id
  end

end

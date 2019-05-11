class CompaniesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  
  def index
    @companies = Company.all.page(params[:page])
  end

  def show
    @company = Company.find(params[:id])
    @items = Item.where(company_id: @company).page(params[:page])
  end

  def new
    begin
      company_params.nil?
      @company = Company.new(company_params)
    rescue
      @company = Company.new
    end
  end
  
  def create
    @company = Company.new(company_params)
    if params[:back]
      redirect_to new_company_path(company: company_params)
    elsif @company.save
      flash[:success] = "ユーザ登録しました"
      redirect_to root_path
    else
      flash[:danger] = "ユーザ登録できませんでした"
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if params[:back]
      render :edit
    elsif @company.update(company_params)
      flash[:success] = "ユーザ情報編集しました"
      redirect_to @company
    else
      flash[:danger] = "ユーザ情報編集できませんでした"
      render :edit
    end
  end

  def confirm
    if request.post?
      @company = Company.new(company_params)
    else
      @company = Company.find(params[:id])
      @company.attributes = (company_params)
    end
    if @company.valid?
      render action: 'confirm'
      return
    else
      render action: request.post? ? 'new' : 'edit'
      return
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:success] = "退会しました"
    redirect_to root_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :company_name, :representative, :capital, :sales, :employee, :url, :country, :zip, :state, :city, :other_address, :phone_num, :business_content, :main_item, :appeal_point)
  end
  
  def company_id
    Company.id
  end

end

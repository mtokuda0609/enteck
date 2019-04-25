class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = "ログインしました"
      redirect_to @company
    else
      flash[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    session[:company_id]='nil'
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
  
  private
  
  def login(name, password)
    @company = Company.find_by(name: name)
    if @company && @company.authenticate(password)
      session[:company_id] = @company.id
      return true
    else
      return false
    end
  end
end

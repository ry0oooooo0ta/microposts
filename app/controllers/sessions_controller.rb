class SessionsController < ApplicationController
 
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "Logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def update #users/:id method=patch
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def edit
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area, :profile, )
  end
end

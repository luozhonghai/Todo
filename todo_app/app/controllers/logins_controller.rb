class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      redirect_to todos_path
    else
      render :new
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_login_path
  end

  private
    def user_params
      params.require(:user).permit(:emal,:password)
    end
end

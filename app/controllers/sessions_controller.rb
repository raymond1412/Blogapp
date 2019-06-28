class SessionsController < ApplicationController
    def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      session[:user_id] = user.id 
      #flash[:success] = "You are Logged In!!"
      redirect_to root_url, notice: 'You are Logged In!!'
    else
      flash[:error] = 'Invalid email or password'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are Logged out!!'
  end
end

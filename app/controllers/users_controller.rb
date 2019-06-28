class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
     @users= User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      #session[:user_id] = @user.id
      flash[:notice] = 'Account created successfully!'
      redirect_to root_path
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

   def update
    @user = User.find(params[:id])
     respond_to do |format|
      if @user.update(user_params)
       format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
      format.html { render action: "edit" }
     end
  end
 end

  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to root_path
  end  

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end

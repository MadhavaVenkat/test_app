class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
        flash[:notice] = "User was successfully created."
      else
        render :new
      end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:notice] = "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
    flash[:notice] = "User was successfully destroyed."
  end

  def query
    @users = User.all
    search_query = request.params[:query]
    @col = []
    @users.each do |rec|
      rec.attributes.each do |k, v|
        next if k == '_id' 
        if v =~ /#{search_query}/
        @col << rec 
        end
      end
    end

  end  

  private

    def set_user     
      @user = User.find(params[:id])    
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email)
    end
end

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # params[:id] is the id of the user we want to show
    puts @user.name
  end

  
end

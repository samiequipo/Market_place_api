class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(users_params) 
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: User.find(params[:id])
  end
  
  def update
    if @user.update(users_params)
      render json: @user, status: :ok   
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  private
  
  def users_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end 
end

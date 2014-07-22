class VendorsController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:show, :edit, :update]

  def show
  end

  def edit
    @update_worked = true
  end

  def destroy
    @vendor.destroy
    session.destroy
    redirect_to root_path
  end

  def update
    @update_worked = @vendor.update(user_params)
    if @update_worked
      redirect_to user_path(@vendor)
    else
      render(:edit)
    end
  end
  
  private

  def load_user
    return @vendor = Vendor.find(params[:id])
  end

  def user_params
    params.require(:vendor).permit(
      :first_name, 
      :last_name, 
      :email, 
      :password, 
      :password_confirmation, 
      :user_name, 
      :type
    )
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize
    unless current_user == @vendor
      redirect_to root_path
    end
  end
end
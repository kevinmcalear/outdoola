class CustomersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:show, :edit, :update]

  def show
  end

  def edit
    @update_worked = true
  end

  def destroy
    @customer.destroy
    session.destroy
    redirect_to root_path
  end

  def update
    @update_worked = @customer.update(user_params)
    if @update_worked
      redirect_to user_path(@customer)
    else
      render(:edit)
    end
  end
  
  private

  def load_user
    return @customer = Customer.find(params[:id])
  end

  def user_params
    params.require(:customer).permit(
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
    unless current_user == @customer
      redirect_to root_path
    end
  end
end
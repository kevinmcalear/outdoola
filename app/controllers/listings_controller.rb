class ListingsController < ApplicationController

  before_action :load_customer
  before_action :authenticate, :authorize, only: [:show, :index]

  def create
    @customer = Customer.find(session[:user_id])
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking = Booking.new(
      customer_id: @customer,
      timeslot_id: @timeslot,
      quantity: params[:quantity],
      cost: (@timeslot.listing.rate.to_i * params[:quantity].to_i)
    )

    if @booking.save()
      redirect_to vendor_listing_timeslot_path(@vendor, @listing, @timeslot)
    else
      render(:new)
    end
  end

  def show
    @booking = Booking.new()
    @listing = Listing.find(params[:id])
    @timeslots = @listing.timeslots
  end

  def index
    @listings = Listing.all
  end


  private

  def load_customer
    return @customer = Customer.find(session[:user_id])
  end

  def listing_params
    params.require(:listing).permit(
      :name,
      :listing_pic_url,
      :description,
      :address,
      :city,
      :state,
      :zip,
      :rate,
      :quantity
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

class TimeslotsController < ApplicationController

  before_action :load_listing
  before_action :load_vendor
  before_action :authenticate, :authorize, only: [:show, :edit, :update]

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)

    if @timeslot.update(listing_id: @listing.id)
      redirect_to vendor_listing_timeslot_path(@vendor, @listing, @timeslot)
    else
      render(:new)
    end
  end

  def show
    @timeslot = Timeslot.find(params[:id])
  end

  def index
    @timeslots = @listing.timeslots
  end

  def edit
    @timeslot = Timeslot.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    @update_worked = true
  end

  def destroy
    @timeslot = Timeslot.find(params[:id])
    @timeslot.destroy
    redirect_to vendor_listing_timeslots_path(@vendor, @listing)
  end

  def update
    @timeslot = Timeslot.find(params[:id])
    @update_worked = @timeslot.update(timeslot_params)
    if @update_worked
      redirect_to vendor_listing_timeslots_path(@vendor, @listing)
    else
      render(:edit)
    end
  end
  
  private

  def load_vendor
    return @vendor = Vendor.find(params[:vendor_id])
  end

  def load_listing
    return @listing = Listing.find(params[:listing_id])
  end

  def timeslot_params
    params.require(:timeslot).permit(
      :date, 
      :start_time, 
      :stop_time,
      :booked
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
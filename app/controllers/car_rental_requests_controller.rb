class CarRentalRequestsController < ApplicationController
  before_action :require_user!, only: %i(approve deny)
  before_action :require_car_ownership!, only: %i(approve deny)

  def approve
    current_car_rental_request.approve!
    redirect_to car_url(current_car)
  end

  def create
    @rental_request = CarRentalRequest.new(car_rental_request_params)
    @rental_request.user_id = current_user.id
    if @rental_request.save
      redirect_to car_url(@rental_request.car)
    else
      flash.now[:errors] = @rental_request.errors.full_messages
      render :new
    end
  end

  def deny
    current_car_rental_request.deny!
    redirect_to car_url(current_car)
  end

  def new
    @rental_request = CarRentalRequest.new(car_id: params[:car_id])
  end

  private

  def current_car_rental_request
    @rental_request ||=
      CarRentalRequest.includes(:car).find(params[:id])
  end

  def current_car
    current_car_rental_request.car
  end

  def require_car_ownership!
    return if current_user.owns_car?(current_car)
    redirect_to car_url(current_car)
  end

  def car_rental_request_params
    params.require(:car_rental_request)
      .permit(:car_id, :end_date, :start_date, :status)
  end
end
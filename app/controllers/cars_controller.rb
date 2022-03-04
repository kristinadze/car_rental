class CarsController < ApplicationController

    before_action :require_user!, only: %i(new create edit update)

    def index
        @cars = Car.all
        render :index
    end

    def browse
        @cars = Car.all
        render :browse
    end

    def show 
        @car = Car.find(params[:id])
        render :show
    end

    def new
        @car = Car.new 
        render :new
    end

    def create
        @car = current_user.cars.new(car_params)
        if @car.save 
            redirect_to car_url(@car)
        else
            flash.now[:errors] = @car.errors.full_messages
            render :new
        end
    end

    def edit 
        @car = Car.find(params[:id])
        render :edit
    end

    def update 
        @car = Car.find(params[:id])
        if @car.update_attributes(car_params)
            redirect_to car_url(@car)
        else
            flash.now[:errors] = @car.errors.full_messages
            render :edit
        end
    end

    private

    def car_params
        params.require(:car).permit(:name, :year, :mpg, :doors, :gas, :seats, :description, :image)
    end
end
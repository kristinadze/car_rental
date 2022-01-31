class CarsController < ApplicationController

    before_action :require_user!, only: %i(new create edit update)

    def index
        @cars = Car.all.with_attached_image
        render :index
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
        @car = Car.create! car_params
        @car.image.attach(params[:car][:image])
        # @car = current_user.cars.new(car_params)
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
        @car = current_user.cars.new(car_params)
        if @car.update_attributes(car_params)
            redirect_to car_url(@car)
        else
            flash.now[:errors] = @car.errors.full_messages
            render :edit
        end
    end

    private

    def car_params
        params.require(:car).permit(:name, :year, :mpg, :doors, :gas, :seats, :description)
    end
end
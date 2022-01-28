class CarsController < ApplicationController
    def index
        @cars = Car.all 
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
        @car = Car.new(car_params)
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
        params.require(:car).permit(:name, :year, :mpg, :doors, :gas, :seats, :description)
    end
end
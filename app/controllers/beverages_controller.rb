class BeveragesController < ApplicationController
  before_action :set_empty_beverage
  
  def new
  end

  def create
    @beverage = Beverage.new(beverage_params)

    if @beverage.save
      redirect_to '/beverages/new', success: 'Beverage successfully added!'
    else
      redirect_to '/beverages/new', alert: @beverage.errors.full_messages.join
    end
  end

  private
  def set_empty_beverage
    @beverage = Beverage.new
  end

  def beverage_params
    params.require(:beverage).permit(:name, :cost)
  end
end
class BeveragesController < ApplicationController
  before_action :set_empty_beverage
  def new
  end

  def create
    @beverage = Beverage.new(beverage_params)
  end

  private
  def set_empty_beverage
    @beverage = Beverage.new
  end

  def beverage_params
    params.require(:beverage).permit(:name, :cost)
  end
end
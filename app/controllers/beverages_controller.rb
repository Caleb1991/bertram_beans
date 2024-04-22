class BeveragesController < ApplicationController
  before_action :set_empty_beverage
  before_action :set_all_beverages, only: :index
  before_action :set_beverage, only: :destroy

  def index
  end
  
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

  def destroy
    if @beverage
      @beverage.destroy
      redirect_to beverage_path
    else
      flash.alert = 'Beverage does not exist'
    end
  end

  private
  def set_empty_beverage
    @beverage = Beverage.new
  end

  def set_all_beverages
    @beverages = Beverage.all
  end

  def set_beverage
    @beverage = Beverage.find(params[:id])
  end

  def beverage_params
    params.require(:beverage).permit(:name, :cost)
  end
end
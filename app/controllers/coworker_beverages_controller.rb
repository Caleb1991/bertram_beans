class CoworkerBeveragesController < ApplicationController
  before_action :set_empty_coworker_beverage, only: :new
  before_action :set_beverages, only: :new
  before_action :set_coworkers_without_beverages, only: :new
  before_action :set_coworkers, only: :index

  def index
    @total_cost = CoworkerBeverage.calculate_grand_total
    @payer = CoworkerBeverage.determine_payer
  end

  def new
  end

  def create
    @coworker_beverage = CoworkerBeverage.new(coworker_beverage_params)

    if @coworker_beverage.save
      redirect_to '/coworker_beverages/new', success: 'Order successfully added!'
    else
      redirect_to '/coworker_beverages/new', alert: @coworker_beverage.errors.full_messages.join
    end
  end

  private
  def set_empty_coworker_beverage
    @coworker_beverage = CoworkerBeverage.new
  end

  def set_beverages
    @beverages = Beverage.all
  end

  def set_coworkers
    @coworkers = Coworker.all.joins(:beverage)
  end

  def set_coworkers_without_beverages
    @coworkers = Coworker.all.find_all { |worker| !worker.beverage }
  end

  def coworker_beverage_params
    params.require(:coworker_beverage).permit(:beverage_id, :coworker_id)
  end
end
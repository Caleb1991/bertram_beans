class CoworkersController < ApplicationController
  before_action :set_empty_coworker, only: :new

  def new
  end

  def create
    @coworker = Coworker.new(coworker_params)

    if @coworker.save
      redirect_to '/', success: 'Coworker successfully added!'
    else
      redirect_to '/coworkers/new', alert: @coworker.errors.full_messages.join
    end
  end

  private
  def set_empty_coworker
    @coworker = Coworker.new
  end
  
  def coworker_params
    params.require(:coworker).permit(:name)
  end
end
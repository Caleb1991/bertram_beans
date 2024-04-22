class CoworkersController < ApplicationController
  before_action :set_empty_coworker, only: :new
  before_action :set_all_coworkers, only: :index
  before_action :set_coworker, only: :destroy

  def index
  end

  def new
  end

  def create
    @coworker = Coworker.new(coworker_params)

    if @coworker.save
      redirect_to '/coworkers/new', success: 'Coworker successfully added!'
    else
      redirect_to '/coworkers/new', alert: @coworker.errors.full_messages.join
    end
  end

  def destroy
    if @coworker
      @coworker.destroy
      redirect_to coworker_path
    else
      flash.error = 'Coworker does not exist'
    end
  end

  private
  def set_empty_coworker
    @coworker = Coworker.new
  end

  def set_all_coworkers
    @coworkers = Coworker.all
  end

  def set_coworker
    @coworker = Coworker.find(params[:id])
  end
  
  def coworker_params
    params.require(:coworker).permit(:name)
  end
end
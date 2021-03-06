class ToursController < ApplicationController
  before_action :authenticate_guide!, only: [:new, :create]

  def index
    @tours = Tour.all
    @categories = Category.all
  end

  def new
    @tour = Tour.new
    @categories = Category.all
    @locations = Location.all
  end

  def create
    @tour = current_guide.tour.new(tour_params)
    if @tour.save
      redirect_to @tour
    else
      flash.now[:notice] = 'Não foi possível criar o passeio'
      render 'new'
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @message = Message.new
  end

  def search
    @tours = Tour.joins(:location).where("city like '%#{params[:location]}%'")
    category_id = params[:category_id].empty?
    @tours = @tours.where(category_id: params[:category_id]) unless category_id
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :location_id, :picture, :category_id,
                                 :guide, :contact, :duration,
                                 :amount, :description)
  end
end

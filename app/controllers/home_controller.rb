class HomeController < ApplicationController
  def index
    @tours = Tour.all
    @categories = Category.all
  end
end

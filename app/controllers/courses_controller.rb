class CoursesController < ApplicationController
  def index
    @courses = Course.all
   # @units = Unit.all
  end

  def show
    @course = Course.find(params[:id])
  end
end

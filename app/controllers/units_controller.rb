class UnitsController < ApplicationController
  def index
    @units = Unit.all
    # @courses = Course.all
  end

  
  def new
    @course = Course.new
  end
  
  def show
    @unit = Unit.find(params[:id])
  end



  def create
    @course = Course.find(params[:course_id])
    @unit = @course.units.create(unit_params)
    redirect_to course_path(@course)
  end

  private
    def unit_params
      params.require(:unit).permit(:title, :body)
    end
end

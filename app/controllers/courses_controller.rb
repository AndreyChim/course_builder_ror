class CoursesController < ApplicationController
  def index
    @courses = Course.all
   # @units = Unit.all
  end

  def new
    @course = Course.new
  end


  def show
    @course = Course.find(params[:id])
  end



def create
  @course = Course.create(params[:course_id])
  #@unit = @course.units.create(unit_params)
  redirect_to course_path(@course)
end

# private
#   def unit_params
#     params.require(:unit).permit(:title, :body)
#   end
# end

end
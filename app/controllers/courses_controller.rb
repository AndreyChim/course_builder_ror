class CoursesController < ApplicationController
  def index
    @courses = Course.all
   # @units = Unit.all
  end

  def show
      @course = Course.find(params[:id])
    # @course = Course.find(params[:course_id])
    end
  
  def new
  end


def create
  @course = Course.new(course_params)
  #@unit = @course.units.create(unit_params)
 # redirect_to course_path(@course)

 if @course.save
  redirect_to @course
else
  render action: 'new'
end
end

# private
#   def unit_params
#     params.require(:unit).permit(:title, :body)
#   end
# end





private

  def course_params
    params.require(:course).permit(:title, :volume)
  end


end
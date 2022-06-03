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

def edit
  @course = Course.find(params[:id])
end

def update
  @course = Course.find(params[:id])

  if @course.update(course_params)
    redirect_to @course
  else
    render action: 'edit'
  end    
end

def destroy
  @course = Course.find(params[:id])
  @course.destroy

  redirect_to courses_path
end




private

  def course_params
    params.require(:course).permit(:title, :volume)
  end


end
require 'pry'

class CoursesController < ApplicationController
  before_action :set_course,  only: [:show, :edit, :update, :destroy]

  def index
  #  @course = Course.new(course_params)
  #  @unit = @course.units.new(unit_params)
   # @units = Unit.all
    @courses = Course.all
  end

  def show
      @course = Course.find(params[:id])
    # @course = Course.find(params[:course_id])
    end
  
  def new
    @course = Course.new
  end


def create
  @course = Course.create(course_params)
  
 
  #@unit = @course.units.create(unit_params)
 # redirect_to course_path(@course)

 redirect_to course_path(@course) 
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
    redirect_to course_path(@course) 
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
 
 # binding.pry
    params.require(:course).permit(:title, :volume, :price, :active)
    #params.permit(:title, :volume, :price, :active)
    
  end

  

  def set_course
   #  binding.pry
    @course = Course.find(params[:id])
  end

end
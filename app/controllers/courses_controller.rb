class CoursesController < ApplicationController
   before_action :set_course, only: [:show, :edit, :update, :destroy]
  # before_action :set_course, only: [:edit, :update, :destroy]
  

  def index
    @courses=Course.all
  end

  def new
    @course = Course.new
  end

  def edit
    # @course = Course.find(params[:course_id])
    @course = Course.find(params[:id])
  end

  def show
     @unit = Unit.find(params[:id])
     @course = Course.find(params[:id])
  end

  def create
    @course = Course.create(course_params)

    #  redirect_to courses_path(@course)
     redirect_to root_path
  end

  def update
    @course.update(course_params)

    redirect_to course_path(@course)
  end

  def destroy
    @course.destroy

    redirect_to courses_path
  end

  private

  def course_params    
    params.require(:course).permit(:title, :volume, :price, :active)
  end

  def set_course
   # binding.pry
    @course = Course.find(params[:id])
  end
end

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  # before_action :set_course, only: [:edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token
  
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token, only: [:update, :edit]
  

  def index
    @courses=Course.all
  end

  def new
    @course = Course.new
  end

  def edit
    # @course = Course.find(params[:course_id])
    # @course = Course.find(params[:id])
    # @course.update(course_params)

    # redirect_to course_path(@course)
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
    # @course.update(course_params)

    @course = Course.find_by_id(params[:id])
   
    if @course && @course.update_attributes(@course_params)
      flash[:success] = "Course successfully Updated!"
      redirect_to course_path(@course)

     else
      flash[:danger] = "Course unsuccessfully Updated!"
     end
    # redirect_to course_path(@course)
    # redirect_to course_path(@course)
    
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

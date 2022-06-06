class UnitsController < ApplicationController
  before_action :set_course,  only: [:show, :edit, :update, :destroy]
  def index
   # @course = Course.new(course_params)
  #  @unit = @course.units.new(unit_params
    @units = Unit.all
    @courses = Course.all

  end

  
  def new
    @course = Course.new
    @unit = Unit.new
  end
  
  def show
    @unit = Unit.find(params[:id])
    @course = Course.find(params[:id])
  end



  def create
    # @course = Course.new(course_params)
    Course.create(title: "Основная информация о виртуальных машинах", volume: "16 час. 4 модуля", price: "7500", active: true)
    # @unit = @course.units.create(unit_params)
    # @unit = @course.units.new(unit_params)

    Unit.create(body: "Content of the body", title: "Title", active: true)
    # redirect_to course_path(@course)
    redirect_to courses_path
    # if @course.save
      # redirect_to @course
      # redirect_to course_path(@course)

      # redirect_to courses_path(@course)
     #else
     # render action: 'new'
    # end
    
  end

  # private
    # def unit_params
      #  params.require(:unit_id).permit(:title, :body)
      #params.permit(:title, :body)
    # end

    # def course_params
      # params.permit(:title, :volume)
     # binding.pry
      # params.require(:course_id).permit(:id, :title, :volume, :price, :active)
    # end
    def set_course
      # binding.pry
      #@course = Course.find(params[:course_id])
      # @course = Course.find(params[:id])
      @course = Course.find(1)
    end
end

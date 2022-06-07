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
    @course = Course.find(params[:course_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @unit = @course.units.build(unit_params)
    @unit.save
    if @unit.save
      flash[:success] = "Unit created!"
      redirect_to courses_path(@course)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update(course_params)

    redirect_to course_path
  end

  def destroy
    @unit = Unit.find(params[:id])
    if @unit.present?
      @unit.destroy
    end
    redirect_to courses_path
  end

  private

  def unit_params
    params.permit(:title, :body)
  end
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
      @course = Course.find(params[:course_id])
    end
end

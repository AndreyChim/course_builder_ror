class UnitsController < ApplicationController
  # before_action :set_course,  only: [:show, :edit, :update, :destroy]
  before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]
  def index
   # @course = Course.new(course_params)
  #  @unit = @course.units.new(unit_params
    # @units = Unit.all
    # @courses = Course.all

  end

  
  def new
    # @course = Course.new
    @unit = Unit.new
  end
  
  def show
    # @unit = Unit.find(params[:id])
    # @course = Course.find(params[:course_id])

    @unit = @course.units.find(params[:id])
  end

  def create
    @unit = @course.units.build(unit_params)
    @unit.save
    if @unit.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

 


  def edit
  end

  def update
    @unit = @course.units.update(unit_params)
    
    redirect_to course_path(@course)
  end

  def destroy    
    @unit = @course.units.find(params[:id])
    if @unit.present?
      @unit.destroy
    end
    redirect_to course_path(@course)
  end

  # private

  # def unit_params
    # params.require(:unit).permit(:title, :body)
  # end


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
    # def set_course
      # binding.pry
      #@course = Course.find(params[:course_id])
      # @course = Course.find(params[:id])
      # @course = Course.find(params[:course_id])
      # @course = Course.find(params[:id])
    # end
# end

private

def set_unit
  @course = Course.find(params[:course_id])
end

def unit_params
  params.permit(:title, :body)
end
end
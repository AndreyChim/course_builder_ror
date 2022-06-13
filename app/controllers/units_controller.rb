class UnitsController < ApplicationController
  #  before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]
   before_action :set_unit, except: [:destroy, :update, :edit, :create, :new, :show]
  
  # def new
    # @course = Course.new
    # @course.units.build
  # end
  
  def new
    @course = Course.new
    # @unit = Unit.new
    # @unuts = Unit.all

    @unit = @course.units.build(unit_params)
  end
  def show
    # @course = Course.find(params[:id])
     @unit = Unit.find(params[:id])
    # @unit = @course.units.find(12) 
    # @course = Course.new
    # @unit = @course.units.find(params[:id])
  end
  
  def index
    @units = Unit.all
  end
  
    

  def create
    @course = Course.find(params[:id])
    @unit = @course.units.create(unit_params) 
    @unit.save

   

     redirect_to course_path(@course)
  end


  

  def update
    # @course = Course.find(params[:id])
    # @unit = @course.units.update(unit_params) 

    # @course, @course.units.find(@unit.id)

    # @unit = Unit.find(params[:id]).update(unit_params)
    # Unit.find(params[:id]).update(unit_params)

    # @unit = @course.units.find(params[:id])

    # @unit.update(unit_params)

    # @course = Course.find(params[:id])
    # @unit = @course.units.update(unit_params) 

    # @course.update(unit_ids: [1,2,3])
    params[:unit][:course_ids] ||= []
    @unit = Unit.find(params[:id])
      @unit.update(params[:unit])

    # @unit.save
    
    # @unit.update(unit_params)
    
    # redirect_to courses_path(@course)
    # redirect_to course_units_path(@unit)
    redirect_to root_path
  end

  def edit
    
    # @unit = Unit.find(params[:id])
    @unit = @course.units.find(params[:id])
    respond_to do |format|
      format.html { render :edit}  #, locals: { @course: @course } }
    end
  end

  def destroy    
    @unit = @course.units.find(params[:id])
    if @unit.present?
      @unit.destroy
    end
    redirect_to course_path(@course)
  end


private

def set_unit
  #  @course = Course.find(params[:course_id])
  #  @course = Course.find(1)
  # @course = Course.find(params[:id])
  # @course = @unit.courses.find(params[:id])
  # @unit = @course.units.find(params[:id])
  #  @course = Course.find(params[:id])
  # @unit = @course.units.find(params[:id])
  
  @units = Unit.find(@course.unit_ids)

  @courses = Course.find(@unit.course_ids)

  @course = @unit.courses.find(1)
  @unit = @course.units.find(1)

   
  # @course = @unit.courses.find(params[:id])
  # @unit = @course.units.find(params[:id])

  # @unit = @course.units.find(params[:id])
  # @unit = Unit.find(params[:unit_id])
end

def unit_params
  # params.require(:unit).permit(:title, :body)
  params.permit(:title, :body, :course_ids)
end

end

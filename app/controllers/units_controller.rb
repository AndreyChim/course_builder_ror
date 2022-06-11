class UnitsController < ApplicationController
  before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]
  
  def show
    @unit = Unit.find(params[:id])
  end
  
  def index
    @units = Unit.all
  end
  
  def new
    @course = Course.new
    @course.units.build
  end

  def create
    @course = Course.find(params[:id])
    @unit = @course.units.create(unit_params) 
    @unit.save

     redirect_to course_path(@course)
  end


  def edit
    @unit = Unit.find(params[:id])
    respond_to do |format|
      format.html { render :edit}  #, locals: { @course: @course } }
    end
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update(unit_params)
    
    redirect_to course_path(@course)
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
  @course = Course.find(params[:course_id])
end

def unit_params
  # params.require(:unit).permit(:title, :body)
  params.permit(:title, :body)
end

end

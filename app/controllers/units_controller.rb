class UnitsController < ApplicationController
   before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]
  
  
  def index
    @units = Unit.all
  end 

  def new
    @course = Course.find(params[:course_id])
  
    @unit = @course.units.build
  
  end

  def show
  
    @course = Course.find(params[:course_id])
  
    @unit = Unit.find(params[:id])
  end
  
  def create

     @course = Course.find(params[:unit][:course_ids])

     @unit = @course.units.create(unit_params) 
   
     @unit.save

     redirect_to course_path(@course)
    
  end
   
    def update
    
    @unit = Unit.find(params[:id])
  
    respond_to do |format|
      format.html do
            if @unit.update(unit_params)
          flash[:success] = 'Course updated successfully'

          redirect_to course_path(params[:unit][:course_ids])
        else

          flash.now[:error] = 'Error: Course could not be updated'
          @unit.errors.messages.inspect
          Rails.logger.info(@course.errors.messages.inspect)

          render :edit #, locals: { question: question }
    
        end
      end
    end
  end

  def edit
    
    @course = Course.includes(:units).find(params[:course_id])
   
    @unit = @course.units.find(params[:id])
    respond_to do |format|
      format.html { render :edit}  #, locals: { @course: @course } }
    end
  end

  def destroy    
    # @unit = @course.units.find(params[:id])
    @unit = Unit.find(params[:id])
    if @unit.present?
      @unit.destroy
      @units = Unit.all
      render 'units/index'
      
      # redirect_to root_path
      # redirect_to action: :index
    end
    
  end


private

def set_unit
  # binding.irb  
  # @course = Course.find(params[:course_id])

  # раб вариант для сохранения в 1 курсе 
  # @course = Course.find(1)

  # рабочий вариант для добавл и редактир модуля ?
  # @course = @unit.courses.find(params[:id])
  # binding.irb  
  # @course = Course.find(params[:course_id])
  # @unit = @course.units.find(params[:id])

end

def course_id_params    
  # params.require(:course_id).permit(:title, :description, :volume, :price, :active, unit_ids: [])
  params[:course_id]
 # binding.irb
end

def unit_params
    params.require(:unit).permit(:title, :body, course_ids: [])
  #binding.irb 
  # params.permit(:title, :body, :course_id, course_ids: [])
  
end

end

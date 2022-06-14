class UnitsController < ApplicationController
   before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]
  #  before_action :set_unit, except: [:destroy, :update, :edit, :create, :new, :show]
  
  def index
    @course = Course.find_by(id: params[:course_id])
    @units = @course.units
  end 


  # def new
    # @course = Course.new
    # @course.units.build
  # end
  
  # def new
    # @course = Course.new
    #  @unit = Unit.new
    # @unuts = Unit.all

    # @unit = @course.units.build(unit_params)
  # end

  def new
    @course = Course.find(params[:course_id])
    @unit = @course.units.build
  end
  def show
    # @course = Course.find(params[:id])
     @unit = Unit.find(params[:id])
    # @unit = @course.units.find(12) 
    # @course = Course.new
    # @unit = @course.units.find(params[:id])
  end
  
  # def index
    # @units = Unit.all
  # end
  
    

  def create
    # @course = Course.new(params[:course])

    @course = Course.first
    #  @course = Course.find(params[:id])
    # @course = Course.find(1)
    # params[:unit][:course_ids] ||=[]
    @unit = @course.units.create(unit_params) 
    # @unit.save
 

    #  redirect_to course_path(@course)
    
    #  @unit = Unit.create(unit_params)

      redirect_to course_path(@course)
      # redirect_to root_path

     
  end

  # def update
    
    # @unit = Unit.find(params[:id])
      # @unit.update(unit_params)

    # redirect_to course_units_path(@unit)
    # redirect_to root_path
  # end

  def update
    
    @unit = Unit.find(params[:id])
  
    respond_to do |format|
      format.html do
            if @unit.update(unit_params)
          flash[:success] = 'Course updated successfully'

          redirect_to course_url
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
    
    @unit = Unit.find(params[:id])
    # @unit = @course.units.find(params[:id])
    respond_to do |format|
      format.html { render :edit}  #, locals: { @course: @course } }
    end
  end

  def destroy    
    # @unit = @course.units.find(params[:id])
    @unit = Unit.find(params[:id])
    if @unit.present?
      @unit.destroy
      redirect_to course_url
    end
    # redirect_to courses_path(@course)
    redirect_to course_url
  end


private

def set_unit
  #  @course = Course.find(params[:course_id])
  #  @course = Course.find(1)

  # ActiveRecord::RecordNotFound: Couldn't find Course without an ID
  #  @course = Course.find(params[:id])

  # @units = Unit.find(@course.unit_ids)
  # @courses = Course.find(@unit.course_ids)

  #  @course = @unit.courses.find(1)
  #  @unit = @course.units.find(1)

  
  # рабочий вариант для добавл и редактир модуля
  # @course = @unit.courses.find(params[:id])
  # @unit = @course.units.find(params[:id])

  # @post = Post.find(params[:comment][:id])    
  # @comments = @post.comments.create(params[:comment])

  # @course = Course.find(params[:course_id])

  # @course = Course.find(params[:id])
  # @course = Course.find(1)


  # @unit = @course.units.find(params[:id])
  @unit = Unit.find(params[:id])


  
end

def unit_params
  params.require(:unit).permit(:title, :body, course_ids: [])
  # params.permit(:title, :body, course_ids: [])
end

end

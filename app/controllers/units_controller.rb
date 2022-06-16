class UnitsController < ApplicationController
   before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]
  #  before_action :set_unit, except: [:destroy, :update, :edit, :create, :new, :show]
  
  def index
    # @course = Course.find_by(id: params[:course_id])
    # binding.irb
    #  @course = Course.find(course_id_params)
    #  @course = Course.first
    # @course = Course.find(params[:unit][:course_ids])
    # @units = @course.units
    @units = Unit.all
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
    # @course = Course.new
    # @course.save
    
    # @course = Course.find(course_id_params)
    
    # binding.irb
    # @unit = @course.units.create(unit_params) 
    
    @unit = @course.units.build
    # @unit = @course.units.create(unit_params) 
      #binding.irb

    # @trip = Trip.new 
    # @trip.itineraries.build 

    #  @course = Course.find(params[:id])
    # @course = Course.find(1)
    # params[:unit][:course_ids] ||=[]
    # @unit = @course.units.create(unit_params) 

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
    #  @course = Course.create(params[:course])
     @course = Course.find(params[:unit][:course_ids])
    #  @course.save
    #  @course = Course.first
    
    # binding.irb
    # пробный вариант
    # @course = Course.find(course_id_params)
     @unit = @course.units.create(unit_params) 

    
    #  @course = Course.find(params[:id])
    # @course = Course.find(1)
    # params[:unit][:course_ids] ||=[]
    
     @unit.save
 

      redirect_to course_path(@course)
    
  end
    #  @unit = Unit.create(unit_params)

      # redirect_to course_path(@course)
      # redirect_to root_path

        
#   @unit = Unit.new(unit_params)

#   # Find schoolclass from `schoolclass_id` and associate it to `@pupil`
#   course = Course.find(params[:unit][:course_ids])  # Handle case when schoolclass not selected in form
#   @unit.courses ||= [course]

#   respond_to do |format|
#     if @unit.save       
#       format.html { redirect_to @unit, notice: 'Pupil was successfully created.' }
#       format.json { render :show, status: :created, location: @unit }
#     else
#       format.html { render :new }
#       format.json { render json: @unit.errors, status: :unprocessable_entity }
#     end
#   end
# end
  



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
    
    # @unit = Unit.find(params[:id])
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
    # redirect_to courses_path(@course)
    # redirect_to course_url
  end


private

def set_unit
  #  @course = Course.find(params[:course_id])
  # раб вариант для сохранения в 1 курсе 
  # @course = Course.find(1)



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
  #
  # params =  
  # @course = Course.find(1)
  # @course = Course.find(params[:course_id])

  # @course = Course.new(course_params)
  # @course.save

  # @course = Course.find(course_id_params)
   # binding.irb

  # @unit = @course.units.find(params[:id])
  # @unit = Unit.find(params[:id])


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
  # binding.irb
  # params.require(:unit).permit(:title, :body)
  
  # params.permit(:title, :body, course_ids: [])
end

end

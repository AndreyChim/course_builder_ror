class UnitsController < ApplicationController
  before_action :set_unit, only: [:destroy, :update, :edit, :create, :new, :show]

  def show
    @unit = @course.units.find(params[:id])
  end

  def index
  end

  def new
<<<<<<< HEAD
    # @course = Course.find(params[:course_id])
    # @course = Course.new
    # @course.save
    @course = Course.find(course_params)
    # binding.irb
    # @unit = @course.units.create(unit_params) 
    
    # @unit = @course.units.build
    @unit = @course.units.create(unit_params) 
    # binding.irb

    

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
=======
    @unit = Unit.new
>>>>>>> 8265fc95f2c8fec77529696b5459e89b35e05857
  end
  
  def create
<<<<<<< HEAD
    # @course = Course.new(params[:course])

    # @course = Course.first

    @course = Course.find(course_params)
    binding.irb
    #  @course = Course.find(params[:id])
    # @course = Course.find(1)
    # params[:unit][:course_ids] ||=[]
    @unit = @course.units.create(unit_params) 
    # @unit.save
 

    #  redirect_to course_path(@course)
    
    #  @unit = Unit.create(unit_params)

=======
    @unit = @course.units.build(unit_params)
    @unit.save
    if @unit.save
>>>>>>> 8265fc95f2c8fec77529696b5459e89b35e05857
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

  private

<<<<<<< HEAD
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
  #
  # params =  
  # @course = Course.find(1)
  # @course = Course.find(params[:course_id])

  # @course = Course.new(course_params)
  # @course.save

  @course = Course.find(course_params)
   # binding.irb

  # @unit = @course.units.find(params[:id])
  # @unit = Unit.find(params[:id])


end

def course_params    
  # params.require(:course_id).permit(:title, :description, :volume, :price, :active, unit_ids: [])
  params[:course_id]
 # binding.irb
end

def unit_params
  #  params.require(:unit).permit(:title, :body, course_ids: [])
  #binding.irb 
  params.permit(:title, :body, course_ids: [])
  # binding.irb
  # params.require(:unit).permit(:title, :body)
  
  # params.permit(:title, :body, course_ids: [])
end
=======
  def set_unit
    @course = Course.find(params[:course_id])
  end
>>>>>>> 8265fc95f2c8fec77529696b5459e89b35e05857

  def unit_params
    params.permit(:title, :body)
  end
end
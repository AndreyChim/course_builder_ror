class CoursesController < ApplicationController
  # before_action :set_course, only: [:show, :edit, :update, :destroy]
  # before_action :set_course, only: [:edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token
  
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token, only: [:update, :edit]
  

  def index
    @courses = Course.all
    # @units = Unit.all
  end

  def new
    @course = Course.new
  end

  

  def show
    # @unit = Unit.find(params[:id])
     @units =  Unit.all
    #  @courses = Course.all
     @course = Course.find(params[:id])
  end

  def create
    @course = Course.create(course_params)

    #  redirect_to courses_path(@course)
     redirect_to root_path
  end

   def update
    # @course.update(course_params)

    # @course = Course.find_by_id(params[:id])
    # @course.update_attributes(@course_params)

    # load existing object again from URL param
    @course = Course.find(params[:id])
    #binding.pry
    # respond_to block

    respond_to do |format|
      format.html do
        
          # if @course.update_attributes(course_params)
            if @course.update(course_params)
            
            # @course.errors.messages.inspect
            # Rails.logger.info(@course.errors.messages.inspect)
            
          # success message
          flash[:success] = 'Course updated successfully'
          # redirect to index
          # redirect_to course_url
          redirect_to root_path
        else
          # error message
          flash.now[:error] = 'Error: Course could not be updated'
          @course.errors.messages.inspect
          Rails.logger.info(@course.errors.messages.inspect)
          # render edit
          render :edit #, locals: { question: question }
    
        end
      end
    end
    
  end

  def edit

          
      @course = Course.find(params[:id])
      @unit = Unit.new
      respond_to do |format|
        format.html { render :edit}  #, locals: { @course: @course } }
      end

    end

    def destroy
      
      @course = Course.find(params[:id])
      @course.destroy
      @courses = Course.all
      render 'courses/index'
      
      # redirect_to :action => :index 
      # redirect_to action: :index

      
      end 

      # redirect_url = (request.referer.include?("/courses/#{@course.id}") ? courses_url : :back)
      # respond_to do |format|
      #   format.html { redirect_to redirect_url }
      #   format.json { head :no_content }
      # end
    
    

  private

  def course_params    
    params.require(:course).permit(:title, :description, :volume, :price, :active, unit_ids: [])
  end

  # def set_course
  #  binding.pry
    # @course = Course.find(params[:id])
  # end

end

class CoursesController < ApplicationController
 before_filter :authenticate_user!, only: [:create, :edit,:update,:delete]
   def new
  	@course =Course.new
  	@category=Category.all
  end
  def create
  	@category=Category.find(params[:id])
  	@course = @category.current_user.courses.build(params[:course])
    @course.user_id = current_user.id
    #@course=Course.new(params[:course])

  	if @course.save
     # signed_in_user
  		flash[:success]="Course Registered Successfully"
  		redirect_to @course
  	else
  		render 'new'
  	end
  end
  def show
  	@course=Course.find(params[:id])
  end
  def edit
  	@course=Course.find(params[:id])
  end
  def update
  	@course=Course.find(params[:id])
  	if @course.update_attributes(params[:course])
  		flash[:success]="Updated Course details Successfully"
  		redirect_to @course
  	else
       render 'edit'
     end
   end
   def index
   	@course=Course.all
   end
   def destroy
      @course = Course.find(params[:id])
      @course.destroy
      flash[:success] = "Successfully destroyed course."
      redirect_to courses_url
    end
end

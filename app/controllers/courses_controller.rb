class CoursesController < ApplicationController
 before_filter :custom_method, :only => [:new, :edit, :create, :destroy]


 def new
   @course =Course.new
   @category=Category.all
 end
 def create
   @category=Category.find(params[:id])
   @course = @category.courses.build(params[:course])
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
 @countCommentsPerPage = 5
    @comments = @course.comments.paginate(page: params[:page], per_page: 5)
    @count = @course.comments.count
    @course = Course.find(params[:id])
end
def edit
 @course=Course.find(params[:id])
end
def update
  @course=Course.find(params[:id])
    #@category=Category.find(params[:id])
    #@course = @category.courses.build(params[:course])
    #@category=(params[:id])
  	#@course=Course.find(params[:id])
    #@category=@course.Course.find(params[:Category_id])
    if @course.update_attributes(params[:course])
      flash[:success]="Updated Course details Successfully"
      redirect_to @course
    else
     render 'edit'
   end
 end
 def index
   @course=Course.all
     #searchValue = params[:keyword] 

   end
   def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:success] = "Successfully destroyed course."
    redirect_to courses_url
  end
  def search
    #@course=Course.find_by_category_id(params[:category_id])
      #@searchValue=params[:category_id]
       #@title = "Bikes"
      # if @course != ""
         @course=Course.all(params[:category_id])
       #else
        # @course=Course.all
       #end
     end
     def destroy
      @course = Course.find(params[:id])
      @course.destroy
      flash[:success] = "Successfully destroyed course."
      redirect_to courses_url
    end
     private
def custom_method
  authenticate_user!

  if current_user.admin
     return
  else
     redirect_to root_url # or whatever
  end
end
   end


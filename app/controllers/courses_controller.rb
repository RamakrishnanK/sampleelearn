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
   if (params[:course][:courseimage] != nil)
    name = params[:course][:courseimage].original_filename
    directory = "#{Rails.root}/public/uploads"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:course][:courseimage].read) }

    @course.courseimage = name
  end

   # @course.uploaded_file = params[:course]
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
  if (params[:course][:courseimage] != nil)
    name = params[:course][:courseimage].original_filename
    File.delete("#{Rails.root}/public/uploads/" + @course.courseimage)
    directory = "#{Rails.root}/public/uploads"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:course][:courseimage].read) }

    params[:course][:courseimage] = params[:course][:courseimage].original_filename
  else
    params[:course][:courseimage] = @course.courseimage
  end
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
      #@course=Course.find_by_category_id(1)
      #if @course.present?
        #@course
      #else
        @course=Course.all(params[:category_id])
      #end
       #else
        # 
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


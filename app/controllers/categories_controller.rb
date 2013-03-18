class CategoriesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :edit,:update,:delete]
  def new
  	@category=Category.new
  end
  def create
  	@category = current_user.categories.build(params[:category])
    @category.user_id = current_user.id
  	if @category.save
  		flash[:success]="Category Inserted Successfully"
  		redirect_to @category
  	else
  		render 'new'
  	end
  end
  def show
  	@category=Category.find(params[:id])
  end
  def edit
  	@category=Category.find(params[:id])
  end
  def update
  	@category=Category.find(params[:id])
  	if @category.update_attributes(params[:category])
  		flash[:success] = "Category updated Successfully..."
  		redirect_to @category
  	else
  		render 'edit'
  	end
   end
   def index
   	@category=Category.all
   end
end

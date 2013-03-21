class UsersController < ApplicationController
	before_filter :custom_method, :only => [:new, :edit, :create, :destroy,:index]
  def show
  	@user=User.find(params[:id])
  end
  def edit
  	@user=User.find(params[:id])
  end
  def update
  	@user=User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:success]="Updated user details successfully"
  		redirect_to users_path
  	else
  		flash[:error]="Sorry Some error"
  		render 'edit'
  	end
  end
  def index
  	@user=User.all
  end
  def custom_method
  authenticate_user!

  if current_user.admin
     return
  else
     redirect_to root_url # or whatever
  end
end
end

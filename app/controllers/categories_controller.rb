class CategoriesController < ApplicationController
 # before_action :require_admin, except: [:index, :show]
   before_action :check_user
   load_and_authorize_resource

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)  
      flash[:notice] = "Category name updated successfully"
      redirect_to @category
    else
      render 'edit'

    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @doctors = @category.doctors
  end

private

def category_params
  params.require(:category).permit(:name)
end

#def require_admin
 # if !(logged_in? && current_user.admin?)
 #   flash[:alert] = "Only admins can perform that action"
 #   redirect_to categories_path
 # end
#end

def check_user
  if current_doctor
    :authenticate_doctor!
  elsif current_patient
    :authenticate_patient!
  end
end

end
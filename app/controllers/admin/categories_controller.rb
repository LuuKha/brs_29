class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = @categories.page params[:page]
  end

  def new
  end

  def create
    if @category.save
      flash[:success] = t "category.success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end  
  
  def destroy
    if @category.destroy
      flash[:success] = t "category.destroy"
    else 
      flash.now[:danger] = t "category.destroy_alert"
    end
    redirect_to admin_categories_path
  end

  def update
    if @category.update category_params
      flash[:success] = t "category.update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit :name, books_attributes: 
      [:title, :author, :number_of_pages, :publish_date, :_destroy]
  end
end

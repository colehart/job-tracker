class CategoriesController < ApplicationController

  def index
    @categories = Category.all

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} created!"
      redirect_to category_path(@category)
    else
      flash[:failed] = "#{@category.title} already Exists!"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was deleted!"
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:title)

  end




end

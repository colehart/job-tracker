# app/controllers/jobs_controller
class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:sort] == 'location'
      @location1 = "All Jobs Sorted by Location"
      @jobs = Job.sort_by_location
    elsif params[:sort] == 'interest'
      @interest = "All Jobs Sorted by Level of Interest"
      @jobs = Job.sort_by_interest_level
    elsif params[:location]
      @location = params[:location]
      @jobs = Job.group_by_city(@location)
    else
      @jobs = Job.all
    end
  end

  def new
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      flash[:failed] = "Please Fill in All the Fields to Create New Job"
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comments = @job.comments.order('created_at DESC')
  end

  def edit
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company = Company.find(@job.company_id), @job)
    else
      flash[:failure] = "Please Fill In All The Fields."
      render :edit
    end
  end

  def destroy
    @job = Job.destroy(params[:id])
    flash[:success] = "#{@job.title} deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end

# app/controllers/job_comments_controller
class JobCommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @company = Company.find(@job.company_id)
    @job_comment = @job.job_comments.new(job_comment_params)
    if @job_comment.save
      flash[:success] = "A job_comment for #{@job.title} has been added!"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  private

  def job_comment_params
    params.require(:job_comment).permit(:content)
  end
end

# app/controllers/comments_controller
class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @company = Company.find(@job.company_id)
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "A comment for #{@job.title} has been added!"
      redirect_to company_job_path(@company, @job)
    else
      flash[:success] = "Please Fill in the Content Field."
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

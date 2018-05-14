require 'rails_helper'

describe JobComment do
  describe 'validations' do
    it 'is invalid without content or job_id' do
      job_comment = JobComment.new
      expect(job_comment).to be_invalid
    end
    it 'is valid with content and job_id' do
      job = Job.new(title: 'Software',
                    level_of_interest: 70,
                    description: 'Wahooo')
      job_comment = job.job_comments.new(content: 'This is some content')
      expect(job_comment).to be_valid
    end
  end
  describe 'relationships' do
    it 'belongs to a job' do
      job_comment = JobComment.new(content: 'This is some content')

      expect(job_comment).to respond_to(:job)
    end
  end
end

require 'rails_helper'

describe JobComment do
  describe 'validations' do
    it 'is invalid without content' do
      job_comment = JobComment.new
      expect(job_comment).to be_invalid
    end
    # it 'is valid with content' do
    #
    # end
  end
  # describe 'relationships' do
  #   it 'belongs to a job' do
  #     job = Job.new(title: 'Software',
  #                   level_of_interest: 70,
  #                   description: 'Wahooo')
  #     expect(job).to respond_to(:company)
  #   end
  # end
end

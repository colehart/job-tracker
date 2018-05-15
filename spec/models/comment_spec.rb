require 'rails_helper'

describe Comment do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        comment = Comment.new
        expect(comment).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'is valid with content' do
        job = Job.new(title: 'Software',
                      level_of_interest: 70,
                      description: 'Wahooo')
        comment = job.comments.new(content: 'This is some content')
        expect(comment).to be_valid
      end
    end
  end
  describe 'relationships' do
    it 'belongs to a job' do
      comment = Comment.new(content: 'This is some content')

      expect(comment).to respond_to(:job)
    end
  end
end

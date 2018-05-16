require 'rails_helper'

describe Job do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        job = Job.new(level_of_interest: 80,
                      description: 'Wahoo',
                      city: 'Denver')
        expect(job).to be_invalid
      end

      it 'is invalid without a level of interest' do
        job = Job.new(title: 'Developer',
                      description: 'Wahoo',
                      city: 'Denver')
        expect(job).to be_invalid
      end

      it 'is invalid without a city' do
        job = Job.new(title: 'Developer',
                      description: 'Wahoo',
                      level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a title, level of interest, city and company' do
        company = Company.new(name: 'Turing')
        category = Category.create!(title: 'Information')
        job = Job.new(title: 'Developer',
                      level_of_interest: 40,
                      city: 'Denver',
                      company: company,
                      category: category)
        expect(job).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      job = Job.new
      expect(job).to respond_to(:company)
    end
    it 'belongs to a category' do
      job = Job.new
      expect(job).to respond_to(:category)
    end
    it 'has many comments' do
      job = Job.new
      expect(job).to respond_to(:comments)
    end
  end

  describe 'class methods' do
    it 'can sort by location' do
      company = Company.new(name: 'Turing')
      category = Category.create!(title: 'Information')
      job1 = Job.create!(title: 'Developer',
                         level_of_interest: 40,
                         city: 'Denver',
                         company: company,
                         category: category)
      job2 = Job.create!(title: 'Developer',
                         level_of_interest: 40,
                         city: 'Seattle',
                         company: company,
                         category: category)
      job3 = Job.create!(title: 'Developer',
                         level_of_interest: 40,
                         city: 'Washington, D.C.',
                         company: company,
                         category: category)

      sorted_jobs = Job.sort_by_location

      expect(sorted_jobs.first.title).to eq(job1.title)
      expect(sorted_jobs.last.title).to eq(job3.title)
    end
    # it 'can sort by city' do
    #   company = Company.new(name: 'Turing')
    #   category = Category.create!(title: 'Information')
    #   job1 = Job.create!(title: 'Developer',
    #                      level_of_interest: 40,
    #                      city: 'Denver',
    #                      company: company,
    #                      category: category)
    #   job2 = Job.create!(title: 'Developer',
    #                      level_of_interest: 40,
    #                      city: 'Seattle',
    #                      company: company,
    #                      category: category)
    #   desired_location = 'Seattle'
    #
    #   sorted_jobs = Job.where(city: desired_location)
    #   expect(sorted_jobs).to eq(job2)
    # end
  end
end

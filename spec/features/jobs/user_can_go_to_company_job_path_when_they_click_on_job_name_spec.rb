require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user can got to job path when they click on job name' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job1 = company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category)
    company.jobs.create!(title: 'QA Analyst',
                         level_of_interest: 70,
                         city: 'New York City',
                         category: category)

    visit jobs_path

    click_on job1.title

    expect(current_path).to eq(company_job_path(company, job1))
    expect(page).to have_content('Developer')

    expect(page).to_not have_content('QA Analyst')
  end
end

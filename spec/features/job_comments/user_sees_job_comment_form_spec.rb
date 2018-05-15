require 'rails_helper'

describe 'User sees a job comment' do
  scenario 'a user sees a job comment form for a specific job' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)

    visit company_job_path(company, job)

    expect(page).to have_css('job-comment-form')
  end
  # scenario 'a user can create job comments for a specific job' do
  #   category = Category.create!(title: 'Information')
  #   company = Company.create!(name: 'ESPN')
  #   job = company.jobs.create!(title: 'Developer',
  #                              level_of_interest: 70,
  #                              city: 'Denver',
  #                              category: category)
  #   job_comment1 = 'This is the first job comment'
  #   job_comment2 = 'This is the second job comment'
  #
  #   visit company_job_path(company, job)
  #
  #   fill_in 'job_comment[content]', with: job_comment1
  #
  #   click_link 'Save'
  #
  #   expect(current_path).to eq(company_job_path(company, job))
  #   expect(page).to have_content(job_comment1)
  #
  #   fill_in 'job_comment[content]', with: job_comment2
  #
  #   click_link 'Save'
  #
  #   expect(page).to have_content(job_comment2)
  # end
end

require 'rails_helper'

describe 'User sees a job comment' do
  scenario 'a user can create new comment by filling out a form' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)

    visit company_job_path(company, job)

    content = 'This is some content'

    fill_in 'job_comment[content]', with: content
    click_on 'Create Job comment'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(content)
  end
end

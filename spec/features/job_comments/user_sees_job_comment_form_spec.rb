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

  scenario 'a user can see newest comment first' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)

    visit company_job_path(company, job)

    content1 = 'This is some old content'

    fill_in 'job_comment[content]', with: content1
    click_on 'Create Job comment'

    expect(page).to have_content(content1)

    content2 = 'This is some newer content'

    fill_in 'job_comment[content]', with: content2
    click_on 'Create Job comment'

    expect(page).to have_content(content2)

    content3 = 'This is the newest content'

    fill_in 'job_comment[content]', with: content3
    click_on 'Create Job comment'

    expect(page).to have_content(content3)
  end
end

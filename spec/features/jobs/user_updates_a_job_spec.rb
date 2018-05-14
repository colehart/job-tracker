require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user sees all the jobs for a specific company' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Programmer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)

    visit company_job_path(company, job)

    click_link 'Edit'

    fill_in 'job[title]', with: 'Developer'
    fill_in 'job[description]', with: 'So fun!'
    fill_in 'job[level_of_interest]', with: 80
    fill_in 'job[city]', with: 'Denver'

    click_on 'Update Job'

    expect(page).to have_content('Developer')
    expect(page).to have_content('So fun!')
    expect(page).to have_content('Denver')
    expect(page).to have_content('80')
  end
end

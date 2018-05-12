require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user sees all the jobs for a specific company' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Programmer', level_of_interest: 70, city: 'Denver')
    job1 = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver')

    visit company_job_path(company, job)

    click_on 'Delete'

    expect(current_path).to eq("/companies/#{company.id}/jobs")

    visit company_job_path(company, job1)

    click_on 'Delete'

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content('Developer deleted!')
  end
end

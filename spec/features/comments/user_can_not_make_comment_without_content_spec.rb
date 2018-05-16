require 'rails_helper'

describe 'User makes comment without content' do
  scenario 'can not make a comment and shown a flash message' do
    flash_message = 'Please Fill in the Content Field.'
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)

    visit company_job_path(company, job)

    click_on 'Create Comment'

    expect(page).to have_content(flash_message)
    expect(page).to have_content('Create new Comment here!')
  end
end

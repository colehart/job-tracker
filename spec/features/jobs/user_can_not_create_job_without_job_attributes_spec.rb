require 'rails_helper'

describe 'User create new job' do
  scenario 'without title' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    flash_message = 'Please Fill in All the Fields to Create New Job'

    visit new_company_job_path(company)

    fill_in 'job[level_of_interest]', with: 80
    fill_in 'job[city]', with: 'Denver'
    select 'Information', from: 'job_category_id'
    click_button 'Create'

    expect(page).to have_content(flash_message)
    expect(page).to have_content("Create a new job at #{company.name} here!")
  end
  scenario 'without city' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    flash_message = 'Please Fill in All the Fields to Create New Job'

    visit new_company_job_path(company)

    fill_in 'job[level_of_interest]', with: 80
    fill_in 'job[title]', with: 'Denver'
    select 'Information', from: 'job_category_id'
    click_button 'Create'

    expect(page).to have_content(flash_message)
    expect(page).to have_content("Create a new job at #{company.name} here!")
  end

  scenario 'without level_of_interest' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    flash_message = 'Please Fill in All the Fields to Create New Job'

    visit new_company_job_path(company)

    fill_in 'job[title]', with: 'Denver'
    fill_in 'job[city]', with: 'Denver'
    select 'Information', from: 'job_category_id'
    click_button 'Create'

    expect(page).to have_content(flash_message)
    expect(page).to have_content("Create a new job at #{company.name} here!")
  end
end

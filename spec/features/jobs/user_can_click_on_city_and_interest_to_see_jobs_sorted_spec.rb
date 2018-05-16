require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'user can see all jobs sorted by city when click on city' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category)
    visit jobs_path

    click_on 'City'

    expect(page).to have_content('All Jobs Sorted by Location')
  end

  scenario 'user can see all jobs sorted by city when click on interest' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 70,
                         city: 'Denver',
                         category: category)
    visit jobs_path

    click_on 'Interest'

    expect(page).to have_content('All Jobs Sorted by Level of Interest')
  end
end

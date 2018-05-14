require 'rails_helper'

describe 'User sees one company' do
  scenario 'a user sees a company' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer',
                         level_of_interest: 90,
                         city: 'Denver',
                         category: category)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content('ESPN')
  end
end

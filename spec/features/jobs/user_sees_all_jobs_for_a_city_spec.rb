require 'rails_helper'

describe 'User sees jobs by city' do
  scenario 'a user sees all the jobs grouped by city' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 30,
                                city: 'Denver',
                                category: category)
    job2 = company.jobs.create!(title: 'UX Designer',
                                level_of_interest: 40,
                                city: 'New York City',
                                category: category)
    job3 = company.jobs.create!(title: 'QA Analyst',
                                level_of_interest: 70,
                                city: 'Washington, D.C.',
                                category: category)
    desired_city = 'Denver'
    visit "/jobs?location=#{desired_city}"

    expect(page).to have_content(job1.title)
    expect(page).to_not have_content(job2.title)
    expect(page).to_not have_content(job3.title)
  end
end

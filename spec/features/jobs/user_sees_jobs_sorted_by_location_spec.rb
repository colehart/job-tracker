require 'rails_helper'

describe 'User sees jobs sorted by location' do
  scenario 'a user sees all the jobs sorted by location' do
    category = Category.create!(title: 'Design')
    company = Company.create!(name: 'ESPN')
    job1 = company.jobs.create!(title: 'Developer',
                                level_of_interest: 70,
                                city: 'Denver',
                                category: category)
    job2 = company.jobs.create!(title: 'UX Designer',
                                level_of_interest: 70,
                                city: 'New York City',
                                category: category)
    job3 = company.jobs.create!(title: 'QA Analyst',
                                level_of_interest: 70,
                                city: 'Washington, D.C.',
                                category: category)

    visit '/jobs?sort=location'

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job3.title)
  end
end

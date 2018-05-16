require 'rails_helper'

describe 'when user visits dashboard' do
  scenario 'a user can see heading' do
    headline = 'Job Tracker'
    visit root_path

    expect(page).to have_content(headline)
  end
  # scenario 'a user can see jobs by interest' do
  #   headline = 'Jobs by Interest'
  #
  #   visit root_path
  #
  #   expect(page).to have_content(headline)
  # end
  scenario 'a user can see jobs by location with count' do
    company = Company.new(name: 'Turing')
    category = Category.create!(title: 'Information')
    job1 = Job.create!(title: 'Developer',
                       level_of_interest: 40,
                       city: 'Denver',
                       company: company,
                       category: category)
    job2 = Job.create!(title: 'Developer',
                       level_of_interest: 40,
                       city: 'Denver',
                       company: company,
                       category: category)
    job3 = Job.create!(title: 'Developer',
                       level_of_interest: 40,
                       city: 'Seattle',
                       company: company,
                       category: category)

    denver_jobs = [job1, job2]

    visit root_path

    expect(page).to have_content(job2)
  end
end

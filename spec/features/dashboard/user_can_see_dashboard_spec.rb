require 'rails_helper'

describe 'when user visits dashboard' do
  scenario 'a user can see heading' do
    headline = 'Job Tracker'
    visit root_path

    expect(page).to have_content(headline)
  end

  scenario 'a user can see jobs by interest' do
    section_header = 'Jobs by Interest'
    company = Company.new(name: 'Turing')
    category = Category.create!(title: 'Information')
    job1 = Job.create!(title: 'Developer',
                       level_of_interest: 40,
                       city: 'Denver',
                       company: company,
                       category: category)
    job2 = Job.create!(title: 'Developer',
                       level_of_interest: 10,
                       city: 'Denver',
                       company: company,
                       category: category)
    job3 = Job.create!(title: 'Developer',
                       level_of_interest: 10,
                       city: 'Seattle',
                       company: company,
                       category: category)
    job4 = Job.create!(title: 'Developer',
                       level_of_interest: 10,
                       city: 'Seattle',
                       company: company,
                       category: category)
    job5 = Job.create!(title: 'Developer',
                       level_of_interest: 5,
                       city: 'Seattle',
                       company: company,
                       category: category)

    visit root_path
    save_and_open_page
    high_interest_job_count = '1 jobs'
    medium_interest_job_count = '3 jobs'
    low_interest_job_count = '1 jobs'

    expect(page).to have_content(section_header)
    expect(page).to have_content(high_interest_job_count)
    expect(page).to have_content(medium_interest_job_count)
    expect(page).to have_content(low_interest_job_count)
  end
  scenario 'a user can see jobs by location with count' do
    company = Company.new(name: 'Turing')
    category = Category.create!(title: 'Information')
    job1 = Job.create!(title: 'Developer',
                       level_of_interest: 30,
                       city: 'Denver',
                       company: company,
                       category: category)
    job2 = Job.create!(title: 'Developer',
                       level_of_interest: 10,
                       city: 'Denver',
                       company: company,
                       category: category)
    job3 = Job.create!(title: 'Developer',
                       level_of_interest: 40,
                       city: 'Seattle',
                       company: company,
                       category: category)

    denver_jobs_link = 'Denver jobs'
    denver_jobs_count = '2 jobs'
    seattle_jobs_link = 'Seattle jobs'
    seattle_jobs_count = '1 jobs'

    visit root_path

    expect(page).to have_link(denver_jobs_link)
    expect(page).to have_link(seattle_jobs_link)
    expect(page).to have_content(denver_jobs_count)
    expect(page).to have_content(seattle_jobs_count)
  end
end

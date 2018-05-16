require 'rails_helper'

describe 'User sees all jobs' do
  scenario 'a user can delete a job  from all jobs menu' do
    category = Category.create!(title: 'Information')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)
    visit jobs_path

    click_on 'Delete'

    expect(page).to_not have_content(job.city)
    expect(page).to_not have_content(job.level_of_interest)
  end

  scenario 'a user can edit a job from jos menu' do
    category = Category.create!(title: 'Information')
    category1 = Category.create!(title: 'Communication')
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer',
                               level_of_interest: 70,
                               city: 'Denver',
                               category: category)


    visit jobs_path

    click_on 'Edit'

    expect(current_path).to eq(edit_company_job_path(company, job))

    title = 'Programmer'
    city = 'Las vegas'
    level_of_interest = '12'

    fill_in 'job[title]', with: title
    fill_in 'job[city]', with: city
    fill_in 'job[level_of_interest]', with: level_of_interest
    select 'Communication', from: 'job_category_id'

    click_on 'Update Job'

    job = Job.first

    expect(page).to have_content(title)
    expect(page).to have_content(city)
    expect(page).to have_content(level_of_interest)
    expect(job.category).to eq(category1)
  end
end

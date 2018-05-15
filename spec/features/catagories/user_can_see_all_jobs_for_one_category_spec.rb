require 'rails_helper'

describe 'User sees one category' do
  scenario 'a user sees all jobs for category' do
    category = Category.create(title: 'Finance')
    company = Company.create!(name: 'Shelby')
    job = company.jobs.create!(title: 'acountant',
                               description: 'accountant in denver',
                               level_of_interest: 100,
                               city: 'denver',
                               category: category)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content(job.title)
    expect(category.jobs.count).to eq(1)
  end

  scenario 'a user can click on job and go to company site' do
    category = Category.create(title: 'Finance')
    company = Company.create!(name: 'Shelby')
    job = company.jobs.create!(title: 'acountant',
                               description: 'accountant in denver',
                               level_of_interest: 100,
                               city: 'denver',
                               category: category)

    visit category_path(category)

    click_on job.title

    expect(current_path).to eq(company_job_path(company, job))
  end
end

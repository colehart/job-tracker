require 'rails_helper'

describe 'when user visits jobs path' do
  scenario 'can go to companies path' do

    visit jobs_path

    click_on 'Companies'

    expect(current_path).to eq(companies_path)
  end

  scenario 'can go to jobs path' do

    visit jobs_path

    click_on 'Jobs'

    expect(current_path).to eq(jobs_path)
  end

  scenario 'can go to categories path' do

    visit jobs_path

    click_on 'Categories'

    expect(current_path).to eq(categories_path)
  end

end

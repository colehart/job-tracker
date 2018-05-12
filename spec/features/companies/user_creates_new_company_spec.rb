require 'rails_helper'

describe 'User creates a new company' do
  scenario 'a user can create a new company' do
    visit new_company_path

    fill_in 'company[name]', with: 'ESPN'
    click_button 'Create'

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content('ESPN')
    expect(Company.count).to eq(1)
  end
end

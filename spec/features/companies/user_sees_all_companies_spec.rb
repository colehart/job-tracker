require 'rails_helper'

describe 'User sees all companies' do
  scenario 'a user sees all the companies' do
    Company.create!(name: 'ESPN')
    Company.create!(name: 'Disney')

    visit companies_path

    expect(page).to have_content('ESPN')
  end
end

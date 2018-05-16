require 'rails_helper'

describe 'User creates a new company' do
  scenario 'without a name and sees flash message' do
    flash_message = 'Please Enter Name Field for Company'
    visit new_company_path

    click_button 'Create'

    expect(page).to have_content(flash_message)
    expect(page).to have_content("Create a new company here!")
  end
end

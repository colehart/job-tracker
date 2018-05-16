require 'rails_helper'

describe 'when user visits company page' do
  it 'brings back to form page if all the attributes are not filled in with flash message' do
    company = Company.create!(name: 'Turing')

    visit company_path(company)
    name = 'Manoj'
    position = 'Hing Manager'
    email = 'manoj.email.com'
    flash_message = 'Please Fill in All the Fields'

    fill_in 'contact[position]', with: position
    fill_in 'contact[email]', with: email

    click_on 'Create'

    expect(page).to have_content(flash_message)
    expect(page).to have_content("Create new Contact here!")
  end
end

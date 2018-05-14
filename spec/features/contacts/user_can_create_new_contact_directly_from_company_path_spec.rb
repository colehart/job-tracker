require 'rails_helper'

describe 'when user visits company  page ' do
  scenario 'a user can create new contact by filling out a form' do
    company = Company.create!(name: "Turing")

    visit company_path(company)
    click_on 'Create New Contact'

    fill_in 'contact[name]', with: 'Manoj'
    fill_in 'contact[position]', with: 'Hiring Manager'
    fill_in 'contact[email]', with: 'manoj.email.com'

    click_on 'Create Contact'


    expect(current_path).to eq(company_path(company))

    expect(page).to have_content('Manoj')
    expect(page).to have_content('Hiring Manager')
    expect(page).to have_content('manoj.email.com')
  end
end

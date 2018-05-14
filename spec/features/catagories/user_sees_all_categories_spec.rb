require 'rails_helper'

describe 'User sees all categories' do
  scenario 'a user sees all the categories' do
    Category.create!(title: 'Education')
    Category.create!(title: 'Finance')

    visit categories_path

    expect(page).to have_content('Education')
    expect(page).to have_content('Finance')
  end
end

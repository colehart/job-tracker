require 'rails_helper'
describe 'user  deletes a category' do
  scenario 'user can delete a category' do
    category = Category.create!(title: 'Education')
    visit categories_path

      click_on 'Delete'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content('Education was deleted')
  end
end

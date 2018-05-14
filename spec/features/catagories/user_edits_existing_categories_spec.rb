require 'rails_helper'

describe 'user edits a existing category' do
  scenario 'user can edit a category' do
    category = Category.create!(title: 'Education')
    visit edit_category_path(category)


    fill_in 'category[title]', with: 'Finance'
    click_on 'Update'

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content('Finance')

  end

end

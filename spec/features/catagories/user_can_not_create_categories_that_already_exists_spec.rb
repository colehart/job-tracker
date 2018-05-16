require 'rails_helper'

describe 'user creates a category' do
  it 'doesnt allow if already exists' do
    category = Category.create(title: 'Education')
    flash_message = "#{category.title} already Exists!"

    visit categories_path

    click_on 'Create New Category'

    fill_in 'category[title]', with: 'Education'
    click_on 'Create Category'

    expect(page).to have_content(flash_message)
  end

  it 'allows if doesnt exists' do
    category = Category.create(title: 'Education')


    visit categories_path

    click_on 'Create New Category'

    fill_in 'category[title]', with: 'Finance'
    click_on 'Create Category'

    expect(page).to_not have_content('Finance already Exists!')
  end
end

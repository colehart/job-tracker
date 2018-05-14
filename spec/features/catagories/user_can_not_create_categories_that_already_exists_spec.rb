require 'rails_helper'

describe 'user creates a category' do
  it 'doesnt allow if already exists' do

    category = Category.create(title: 'Education')

    visit categories_path

    click_on 'Create New Category'

    fill_in 'category[title]', with: 'Education'
    click_on 'Create Category'

    expect(page).to have_content('Education already Exists!')
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

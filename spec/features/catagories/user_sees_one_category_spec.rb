require 'rails_helper'

describe 'User sees one category' do
  scenario 'a user sees a category' do
    category = Category.create(title: 'Finance')

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content(category.title)
  end

  scenario 'a user can go back to  categories' do
    category = Category.create(title: 'Finance')

    visit category_path(category)
    click_on 'Categories'

    expect(current_path).to eq(categories_path)
  end
end

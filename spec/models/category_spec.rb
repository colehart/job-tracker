
require 'rails_helper'

describe Category do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        category = Category.new()
        expect(category).to be_invalid
      end
    end
  end

  describe 'validations' do
    context 'valid attributes' do
      it 'is valid with a title' do
        category = Category.new(title: 'education')
        expect(category).to be_valid
      end
    end
  end
end

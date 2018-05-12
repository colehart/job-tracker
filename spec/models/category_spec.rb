require 'rails_helper'

describe Category do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        company = Category.new()
        expect(company).to be_invalid
      end
    end
  end
end

require 'rails_helper'

describe Contact do
  describe 'validations' do
    it 'is invalid without a name' do
      contact = Contact.new(position: 'Hiring manager', email: 'hiring_manager.gmail.com')

      expect(contact).to be_invalid
    end
    it 'is invalid without a position' do
      contact = Contact.new(name: 'Manoj', email: 'hiring_manager.gmail.com')

      expect(contact).to be_invalid
    end

    it 'is invalid without a email' do
      contact = Contact.new(name: 'Manoj', position: 'hiring manager')

      expect(contact).to be_invalid
    end
  end

  describe 'validations' do
    it 'is valid with name position and  a email' do
      company = Company.create(name: 'Turing')
      contact = Contact.new(company: company, name: 'Manoj', position: 'hiring manager', email: 'hiring_manager.gmail.com')

      expect(contact).to be_valid
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      company = Company.create(name: 'Turing')
      contact = Contact.new(company: company, name: 'Manoj', position: 'hiring manager', email: 'hiring_manager.gmail.com')

      expect(contact).to respond_to(:company)
    end
  end
end

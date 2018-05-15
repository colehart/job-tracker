# app/models/contact
class Contact < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true
  validates :email, presence: true

  belongs_to :company
end

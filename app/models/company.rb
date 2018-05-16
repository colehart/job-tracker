# app/models/company
class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_companies_by_interest
      joins(:jobs).select('companies.name, avg(jobs.level_of_interest) AS avg_interest').group('companies.id').order('avg_interest DESC').limit(3)
  end
end

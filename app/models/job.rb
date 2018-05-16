# app/models/job
class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_location
    order('city ASC')
  end

  def self.sort_by_interest_level
    order('level_of_interest DESC')
  end

  def self.group_by_city(desired_city)
    select('*').where(city: desired_city)
  end

  def self.count_by_city
    select('jobs.city, count(jobs.id) as job_count').group('jobs.city').order('job_count DESC').limit(3)
  end
end

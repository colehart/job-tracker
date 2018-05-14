# app/models/job_comments
class JobComment < ApplicationRecord
  validates_presence_of :content
  # belongs_to :company
end

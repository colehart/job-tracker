# app/models/job_comments
class Comment < ApplicationRecord
  validates_presence_of :content
  belongs_to :job
end

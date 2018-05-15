# db/migrate
class AddJobIdToJobComments < ActiveRecord::Migration[5.1]
  def change
    add_column :job_comments, :job_id, :integer
  end
end

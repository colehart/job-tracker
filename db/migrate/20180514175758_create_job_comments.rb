# db/migrate/create_job_comments
class CreateJobComments < ActiveRecord::Migration[5.1]
  def change
    create_table :job_comments do |t|
      t.text :content

      t.timestamps
    end
  end
end

class CreateJobtags < ActiveRecord::Migration
  def change
    create_table :jobtags do |t|
      t.string :job_id
      t.string :tag_id

      t.timestamps
    end
  end
end

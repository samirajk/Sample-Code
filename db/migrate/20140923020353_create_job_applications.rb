class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.string :coverletter
      t.datetime :date_of_application
      t.string :status

      t.timestamps
    end
  end
end

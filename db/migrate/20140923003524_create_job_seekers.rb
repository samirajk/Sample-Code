class CreateJobSeekers < ActiveRecord::Migration
  def change
    create_table :job_seekers do |t|
      t.string :name
      t.string :e-mail
      t.string :phone_number
      t.string :skills[]
      t.string :resume

      t.timestamps
    end
  end
end

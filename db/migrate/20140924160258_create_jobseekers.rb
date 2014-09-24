class CreateJobseekers < ActiveRecord::Migration
  def change

    create_table :jobseekers do |t|
      t.string :name
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :phonenumber
      t.string :skills
      t.string :resume

      t.timestamps
    end
  end
end

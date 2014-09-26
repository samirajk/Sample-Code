class CreateJobapplications < ActiveRecord::Migration
  def change
    create_table :jobapplications do |t|
      t.text :coverletter
      t.datetime :dateofapplication
      t.string :status

      t.references :job
      t.references :jobseeker
      t.timestamps
    end
  end
end

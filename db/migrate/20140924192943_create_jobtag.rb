class CreateJobtag < ActiveRecord::Migration
  def change
    create_table :jobtag do |t|
      t.references :job
      t.references :tag
    end
  end
end

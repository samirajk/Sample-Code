class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.datetime :application_deadline
      t.references :category
      t.references :tags
      t.references :employers
      t.timestamps
    end
  end
end

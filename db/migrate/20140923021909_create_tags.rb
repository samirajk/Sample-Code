class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag

      t.references :employers
      t.references :jobs
      t.timestamps
    end
  end
end

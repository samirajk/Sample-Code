class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :user
    end
  end
end

class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company
      t.string :contact
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end

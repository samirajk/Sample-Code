require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def test_admin
  admin = Admin.new :company => admins(:one).company,
                          :contact => admins(:one).contact,
                          :email => admins(:one).email,
                          :password_hash => admins(:one).password_hash,
                          :password_salt => admins(:one).password_salt

  assert admin.save

  assert admin.destroy
    end
end

require 'test_helper'

class EmployerTest < ActiveSupport::TestCase
  fixtures :employers

  def test_employer

    employer = Employer.new :company => employers(:one).company,
                         :contact => employers(:one).contact,
                         :email => employers(:one).email,
                         :password_hash => employers(:one).password_hash,
                         :password_salt => employers(:one).password_salt

    assert employer.save

    assert employer.destroy
    end
end

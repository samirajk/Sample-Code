require 'test_helper'

class JobApplicationTest < ActiveSupport::TestCase
  def test_jobapplication
    jobapplication = Jobapplication.new :company => Jobapplications(:one).company,
                      :contact => jobapplications(:one).contact,
                      :email => jobapplications(:one).email,
                      :password_hash => jobapplications(:one).password_hash,
                      :password_salt => jobapplications(:one).password_salt

    assert jobapplication.save

    assert jobapplication.destroy
  end
end

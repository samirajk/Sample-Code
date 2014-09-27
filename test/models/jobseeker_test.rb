require 'test_helper'

class JobseekerTest < ActiveSupport::TestCase
  def test_jobseeker
    jobseeker = Jobseeker.new :name => jobseekers(:one).name,
                      :skills => jobseekers(:one).skills,
                      :resume => jobseekers(:one).resume,
                      :password_hash => jobseekers(:one).password_hash,
                      :password_salt => jobseekers(:one).password_salt

    assert jobseeker.save

    assert jobseeker.destroy
  end
end

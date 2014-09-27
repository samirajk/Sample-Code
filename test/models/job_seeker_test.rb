require 'test_helper'

class JobSeekerTest < ActiveSupport::TestCase
  def test_jobseeker
  jobseeker = Jobseeker.new :name => jobseekers(:one).name,
                    :password_hash => jobseekers(:one).password_hash,
                    :password_salt => jobseekers(:one).password_salt,
                    :skills => jobseekers(:one).skills,
                    :resume => jobseekers(:one).resume

  assert jobseeker.save

  assert jobseeker.destroy
end
end
require 'test_helper'

class JobapplicationTest < ActiveSupport::TestCase

  def jobapplication_test
    jobapplication = Jobapplication.new :coverletter => jobapplications(:one).coverletter,
                      :dateofapplication => jobapplications(:one).dateofapplication,
                      :status => jobapplications(:one).status,

    assert jobapplication.save

    assert jobapplication.destroy
  end
end

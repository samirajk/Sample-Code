require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  def test_application
    application = Application.new :company => applications(:one).user

    assert application.save

    assert application.destroy
  end
end

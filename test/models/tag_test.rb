require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def tag_test
    tag = Tag.new :company => tags(:one).tag
    assert tag.save

    assert tag.destroy
  end
end

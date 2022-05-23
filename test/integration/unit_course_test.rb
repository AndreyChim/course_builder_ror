require 'test_helper'

class UnitCourseTest < ActiveSupport::TestCase
  

  test "unit_count" do
    assert_equal 1, Course.count
    assert_equal 3, Unit.count
  end
end


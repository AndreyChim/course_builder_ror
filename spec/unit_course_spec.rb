require 'rails_helper'
#require 'test_helper'

#class UnitCourseTest < ActiveSupport::TestCase

  RSpec.describe "unit course spec" do
    describe "habtm" do
      it "should be able to perform relations" do
  

 # test "unit_count" do
    assert_equal 1, Course.count
    assert_equal 3, Unit.count
  end
end


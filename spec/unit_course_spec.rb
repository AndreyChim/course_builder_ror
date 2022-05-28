require 'rails_helper'
require 'test_helper'


  RSpec.describe "unit course spec" do
    describe "habtm" do
 

    describe Unit do
      it "should have many courses" do
        t = Unit.reflect_on_association(:courses)
        expect(t.macro).to eq(:has_and_belongs_to_many)

      end
    end
    
    describe Course do
      it "should have many units" do
         t = Course.reflect_on_association(:units)
         expect(t.macro).to eq(:has_and_belongs_to_many)

      end
    end
    

  class UnitTest < ActiveSupport::TestCase
    test "unit_count" do
      assert_equal 3, Unit.count
      assert_equal 2, Course.count
      
    end
  end
  
  describe Course do
    it "should have many units" do
  Course.joins(:units).first.valid? 
  Unit.joins(:courses).first.valid? 

    end
  end

  end
end


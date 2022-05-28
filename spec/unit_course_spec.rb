require 'rails_helper'
require 'test_helper'

#class UnitCourseTest < ActiveSupport::TestCase

  RSpec.describe "unit course spec" do
    describe "habtm" do
 
 # it "should have and belong many to Units" do
  # assc = described_class.reflect_on_association(:units)
  # expect(assc.macro).to eq :has_and_belongs_to_many
  # it { should belong_to(:referencer) }
   
   #https://stackoverflow.com/questions/54114452/rails-shoulda-matchers-belong-to-optional-test
   #it { should belong_to(:organization).optional }

  # it { is_expected.to belong_to(:referencer) } do

  
    # expect((Unit.where(active: :true)).count).to eq(3)

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
    
   # describe Unit, type: :model do
      #it { expect(described_class.reflect_on_association(:units).macro).to eq(:has_and_belongs_to_many) }
      #it { Unit.reflect_on_association(:units).macro.should   eq(:has_and_belongs_to_many) }

  



  class UnitTest < ActiveSupport::TestCase
    test "unit_count" do
      assert_equal 3, Unit.count
      assert_equal 2, Course.count
    end
  end
  
  end
end


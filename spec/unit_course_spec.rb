require 'rails_helper'
require 'test_helper'

#class UnitCourseTest < ActiveSupport::TestCase

  RSpec.describe "unit course spec" do
    describe "habtm" do
 
 it "should have and belong many to Units" do
  assc = described_class.reflect_on_association(:units)
  expect(assc.macro).to eq :has_and_belongs_to_many
end
    
  end
end


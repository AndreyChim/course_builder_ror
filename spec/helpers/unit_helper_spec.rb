require 'rails_helper'

RSpec.describe UnitHelper, type: :helper do
#  pending "add some examples to (or delete) #{__FILE__}"



  describe "#page_title" do
    it "returns the instance variable" do
      assign(:title, "My Title")
      expect(helper.page_title).to eql("My Title")
    end
  end
end
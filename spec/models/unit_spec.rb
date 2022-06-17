require 'rails_helper'


RSpec.describe Unit, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context "validations tests" do
    it "ensures the title is present" do
      unit = Unit.new(body: "Content of the body")
      expect(unit.valid?).to eq(false)
    end

    it "ensures the body is present" do
      unit = Unit.new(title: "Title")
      expect(unit.valid?).to eq(false)
    end

    it "ensures the Course is active by default" do
      unit = Unit.new(body: "Content of the body", title: "Title")
      expect(unit.active?).to eq(true)
    end

    it "should be able to save Course" do
      unit = Unit.new(body: "Content of the body", title: "Title")
      expect(unit.save).to eq(true)
    end
  end

  
  context "scopes tests" do
    let(:params) { { body: "Content of the body", title: "Title", active: true } }
    before(:each) do
      Unit.create(params)
      Unit.create(params)
      Unit.create(params)
      Unit.create(params.merge(active: false))
      Unit.create(params.merge(active: false))
    end

    it "should return all active Units" do
      expect((Unit.where(active: :true)).count).to eq(3)
    end

    it "should return all inactive Units" do
      expect((Unit.where(active: :false)).count).to eq(2)
    end
  end

  

end

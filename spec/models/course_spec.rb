require 'rails_helper'


RSpec.describe Course, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context "validations tests" do
    it "ensures the title is present" do
      course = Course.new(volume: "Content of the volume")
      expect(course.valid?).to eq(false)
    end

    it "ensures the volume is present" do
      course = Course.new(title: "Title")
      expect(course.valid?).to eq(false)
    end

    it "ensures the Course is active by default" do
      course = Course.new(volume: "Content of the volume", title: "Title")
      expect(course.active?).to eq(true)
    end

    it "should be able to save Course" do
      course = Course.new(volume: "Content of the volume", title: "Title")
      expect(course.save).to eq(true)
    end
  end

  
  context "scopes tests" do
    let(:params) { { volume: "Content of the volume", title: "Title", active: true } }
    before(:each) do
      Course.create(params)
      Course.create(params)
      Course.create(params)
      Course.create(params.merge(active: false))
      Course.create(params.merge(active: false))
    end

    it "should return all active Courses" do
      expect((Course.where(active: :true)).count).to eq(3)
    end

    it "should return all inactive Courses" do
      expect((Course.where(active: :false)).count).to eq(2)
    end
  end

  
end

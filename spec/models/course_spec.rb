require 'rails_helper'


RSpec.describe Course, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context "validations tests" do
    it "ensures the title is present" do
      course = Course.new(body: "Content of the body")
      expect(course.valid?).to eq(false)
    end

    it "ensures the body is present" do
      course = Course.new(title: "Title")
      expect(course.valid?).to eq(false)
    end

    it "ensures the Course is active by default" do
      course = Course.new(body: "Content of the body", title: "Title")
      expect(course.active?).to eq(true)
    end

    it "should be able to save Course" do
      course = Course.new(body: "Content of the body", title: "Title")
      expect(course.save).to eq(true)
    end
  end

  
  context "scopes tests" do
    let(:params) { { body: "Content of the body", title: "Title", active: true } }
    before(:each) do
      Course.create(params)
      Course.create(params)
      Course.create(params)
      Course.create(params.merge(active: false))
      Course.create(params.merge(active: false))
    end

    it "should return all active Courses" do
      expect(course.active.count).to eq(3)
    end

    it "should return all inactive Courses" do
      expect(course.inactive.count).to eq(2)
    end
  end
end

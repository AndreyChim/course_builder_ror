require 'rails_helper'

RSpec.describe UnitsController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "routing" do

    it { expect(put: "/courses/1/units/1").to route_to(controller: "units", action: "update", course_id: "1", id: "1") }
  
    it { expect(GET: "/courses/1/units/1").to route_to(controller: 'units', action: 'show', course_id: "1", id: "1") }
  
    it { expect(get: '/units').to route_to(controller: 'units', action: 'index') }
  
    end
end
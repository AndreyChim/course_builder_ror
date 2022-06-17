require 'rails_helper'
require 'spec_helper'

  RSpec.describe CoursesController, :type => :controller do
    describe "GET index" do
      it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
 

    describe "routing" do

  it { expect(put: "/courses/1").to route_to(controller: "courses", action: "update", id: "1") }

  it { expect(GET: "/courses/1").to route_to(controller: 'courses', action: 'show', id: "1") }

  it { expect(get: '/courses').to route_to(controller: 'courses', action: 'index') }

  end
end
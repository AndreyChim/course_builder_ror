require 'rails_helper'

RSpec.describe CoursesController do
    describe "GET index" do
      it "assigns @courses" do
        course = Course.create
        get :index
        expect(assigns(:courses)).to eq([course])
      end
  
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end
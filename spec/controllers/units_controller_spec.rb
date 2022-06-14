require 'rails_helper'

RSpec.describe UnitsController do
    describe "GET index" do
      it "assigns @units" do
        unit = Unit.create
        get :index
        expect(assigns(:units)).to eq([unit])
      end
  
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end
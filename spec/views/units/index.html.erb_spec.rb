require 'rails_helper'

RSpec.describe "units/index" do
  context "displays all the units" do
# RSpec.describe "units/index.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "displays all the units" do
    assign(:units, [
      Unit.create!(:title => "title", :body => "body")
     
    ])

    render

    expect(rendered).to match /title/
 
  end

end

end



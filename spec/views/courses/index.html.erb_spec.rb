require 'rails_helper'

RSpec.describe "courses/index" do
  context "displays all the courses" do
# RSpec.describe "courses/index.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "displays all the courses" do
    assign(:courses, [
      Course.create!(:title => "title", :volume => "volume")
     
    ])

    render

    expect(rendered).to match /title/
 
  end

end

end



require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :hair_color => "Hair Color",
        :eye_color => "Eye Color",
        :alive => false
      ),
      Person.create!(
        :hair_color => "Hair Color",
        :eye_color => "Eye Color",
        :alive => false
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Hair Color".to_s, :count => 2
    assert_select "tr>td", :text => "Eye Color".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :hair_color => "Hair Color",
      :eye_color => "Eye Color",
      :alive => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Hair Color/)
    expect(rendered).to match(/Eye Color/)
    expect(rendered).to match(/false/)
  end
end

require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :hair_color => "MyString",
      :eye_color => "MyString",
      :alive => false
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[hair_color]"

      assert_select "input[name=?]", "person[eye_color]"

      assert_select "input[name=?]", "person[alive]"
    end
  end
end

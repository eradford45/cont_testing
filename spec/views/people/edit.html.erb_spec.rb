require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :hair_color => "MyString",
      :eye_color => "MyString",
      :alive => false
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[hair_color]"

      assert_select "input[name=?]", "person[eye_color]"

      assert_select "input[name=?]", "person[alive]"
    end
  end
end

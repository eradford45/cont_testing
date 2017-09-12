require 'rails_helper'



RSpec.describe PeopleController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Person. As you add validations to Person, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {hair_color: "blue", eye_color: "orange"}
  }

  let(:invalid_attributes) {
    {hair_color: "", eye_color: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PeopleController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      person = Person.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      person = Person.create! valid_attributes
      get :show, params: {id: person.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      person = Person.create! valid_attributes
      get :edit, params: {id: person.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Person" do
        expect {
          post :create, params: {person: valid_attributes}, session: valid_session
        }.to change(Person, :count).by(1)
      end

      it "redirects to the created person" do
        post :create, params: {person: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Person.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {person: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {eye_color: 'gray'}
      }

      it "updates the requested person" do
        person = Person.create! valid_attributes
        put :update, params: {id: person.to_param, person: new_attributes}, session: valid_session
        person.reload
        expect(person.eye_color).to eq(new_attributes[:eye_color])
      end

      it "redirects to the person" do
        person = Person.create! valid_attributes
        put :update, params: {id: person.to_param, person: valid_attributes}, session: valid_session
        expect(response).to redirect_to(person)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        person = Person.create! valid_attributes
        put :update, params: {id: person.to_param, person: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested person" do
      person = Person.create! valid_attributes
      expect {
        delete :destroy, params: {id: person.to_param}, session: valid_session
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      person = Person.create! valid_attributes
      delete :destroy, params: {id: person.to_param}, session: valid_session
      expect(response).to redirect_to(people_url)
    end
  end

end

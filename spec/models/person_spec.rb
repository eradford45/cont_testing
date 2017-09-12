require 'rails_helper'

RSpec.describe Person, type: :model do
   describe 'validations' do
      it { should validate_presence_of(:eye_color) }
      it { should validate_presence_of(:hair_color) }
    end
end

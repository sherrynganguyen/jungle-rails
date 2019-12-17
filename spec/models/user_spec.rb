require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    :firstname => "Pikachu",
    :lastname => "Pokemon",
    :email => "test@test.com",
    :password => "123",
    :password_confirmation => "123"
    )
  }
  
  describe 'Validations' do
    it "should have same password and password confirmation" do
      expect(subject.password).to eq(subject.password_confirmation)
    end
  end

  describe '.authenticate_with_credentials' do
  end

end

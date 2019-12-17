require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    :firstname => "Pikachu",
    :lastname => "Pokemon",
    :email => "TEST@TEST.com",
    :password => "1234567",
    :password_confirmation => "1234567"
    )
  }
  
  describe 'Validations' do
    it "should have same password and password confirmation" do
      expect(subject.password).to eq(subject.password_confirmation)
    end
    it 'validates uniqueness of email' do
      @user_with_same_email = subject.dup
      @user_with_same_email.save
      expect(subject.email.downcase).to eq(@user_with_same_email.email)
    end
    it "is not valid without a first name" do
      subject.firstname = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Firstname can't be blank")
    end
    it "is not valid without a last name" do
      subject.lastname = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Lastname can't be blank")
    end
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end
    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).not_to be_empty
    end
    it "is not valid without password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).not_to be_empty
    end
    it "is not valid without a password less than 6 characters" do
      subject.password = "123"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "is not valid without a password more than 14 characters" do
      subject.password = "12346456423423424234"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too long (maximum is 14 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it "returns an instance of the user when email and password are correct" do

    end
    it "returns nil when either email or password is incorrect" do
      
    end 
  end

end

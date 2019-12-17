require 'rails_helper'

RSpec.describe Product, type: :model do
  
  category = Category.new(:name => "Shoes")
  subject { described_class.new(
    :name => "Nike Shoes",
    :category => category,
    :price_cents => "199.99",
    :quantity => "3",
    )
  }
  
  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is not valid without category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end

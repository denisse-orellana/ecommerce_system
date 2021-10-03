require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { Product.create(name: 'Tshirt', description: "without sleeves", price: 99, sku: "9k9k9k9k") }

  before { subject.save }

    it 'name should be presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    
    it 'description should be presence' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'price should be presence' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'sku should be presence' do
      subject.sku = nil
      expect(subject).to_not be_valid
    end
    
end

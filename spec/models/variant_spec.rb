require 'rails_helper'

RSpec.describe Variant, type: :model do

  subject { Variant.create(size_id: 1, color_id: 2, product_id: 3, stock: 100) }

  before { subject.save }

    it 'size id should be presence' do
      subject.size_id = nil
      expect(subject).to_not be_valid
    end

    it 'color id should be presence' do
      subject.color_id = nil
      expect(subject).to_not be_valid
    end
 
    it 'product id should be presence' do
      subject.product_id = nil
      expect(subject).to_not be_valid
    end

    it 'stock should be presence' do
      subject.stock = nil
      expect(subject).to_not be_valid
    end
end

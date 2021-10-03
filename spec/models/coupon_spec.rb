require 'rails_helper'

RSpec.describe Coupon, type: :model do

  subject { Coupon.create(name: "coupon", code: "0909", discount: 3500) }

  before { subject.save }

    it 'name should be presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'code should be presence' do
      subject.code = nil
      expect(subject).to_not be_valid
    end

    it 'discount should be presence' do
      subject.discount = nil
      expect(subject).to_not be_valid
    end

end

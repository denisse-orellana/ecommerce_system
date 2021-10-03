require 'rails_helper'

RSpec.describe UserCoupon, type: :model do
  
  subject { UserCoupon.create(user_id: 1, coupon_id: 2, order_id: 3, active: false) }

  before { subject.save }

    it 'user_id should be presence' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'coupon_id should be presence' do
      subject.coupon_id = nil
      expect(subject).to_not be_valid
    end

    it 'order_id should be presence' do
      subject.order_id = nil
      expect(subject).to_not be_valid
    end

    it 'active should be presence' do
      subject.active = nil
      expect(subject).to_not be_valid
    end
end

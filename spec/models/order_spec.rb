require 'rails_helper'

RSpec.describe Order, type: :model do

  subject { Order.create(user_id: 1, number: "2", total: 3.5, state: "progress") }

  before { subject.save }

    it 'user_id should be presence' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'number: should be presence' do
      subject.number = nil
      expect(subject).to_not be_valid
    end

    it 'total should be presence' do
      subject.total = nil
      expect(subject).to_not be_valid
    end

    it 'state should be presence' do
      subject.state = nil
      expect(subject).to_not be_valid
    end
  
end

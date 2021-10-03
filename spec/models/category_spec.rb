require 'rails_helper'

RSpec.describe Category, type: :model do

  subject { Category.create(name: "categoryone") }

  before { subject.save }

    it 'name should be presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
end

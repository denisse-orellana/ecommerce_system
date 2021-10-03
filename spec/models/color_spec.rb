require 'rails_helper'

RSpec.describe Color, type: :model do

  subject { Color.create(name: "red") }

  before { subject.save }

    it 'name should be presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
end

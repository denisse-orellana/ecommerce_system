require 'rails_helper'

RSpec.describe Size, type: :model do

  subject { Size.create(name: "xl") }

  before { subject.save }

    it 'name should be presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
end

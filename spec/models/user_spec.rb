require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { User.create(email: "example@test.com") }

  before { subject.save }

    it 'email should be presence' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
end

require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  subject { Admin.create(email: "example@test.com") }

  before { subject.save }

    it 'email should be presence' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
end

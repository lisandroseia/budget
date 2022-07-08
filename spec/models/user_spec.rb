require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  before { subject.save }

  it 'User does not have errors if name, email and password given' do
    expect(subject).to be_valid
  end

  it 'email shouldnt be null' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name length should be bigger than 4' do
    subject.name = 'hi'
    expect(subject).to_not be_valid
  end
end

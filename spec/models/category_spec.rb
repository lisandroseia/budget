require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  subject { create(:category, user_id: user.id) }
  before { subject.save }

  it 'category does not have errors if name and icon are valids' do
    expect(subject).to be_valid
  end

  it 'name length should be bigger than 4' do
    subject.name = 'hi'
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'total should be 0' do
    expect(subject.total).to be(0)
  end
end

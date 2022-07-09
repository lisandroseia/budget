require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { create(:user) }
  subject { create(:payment, author_id: user.id) }
  before { subject.save }

  it 'payment does not have errors if name and amount are valids' do
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

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'name should be grater than 0' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end
end

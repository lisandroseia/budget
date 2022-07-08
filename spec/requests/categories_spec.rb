require 'rails_helper'

RSpec.describe '/categories', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  before(:each) do
    user.confirmed_at = Time.now
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get categories_path
      expect(response).to render_template('categories/index')
    end
  end

  it 'renders a successful response' do
    get new_category_url
    expect(response).to be_successful
  end
end

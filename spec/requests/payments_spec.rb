require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  describe 'GET /index' do
    it 'redirects to splash screen if not authenticaded' do
      get categories_path

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

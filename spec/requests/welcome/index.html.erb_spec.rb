require 'rails_helper'

RSpec.describe WelcomesController, type: :request do
  describe 'GET /index' do
    before do
      get unauthenticated_user_root_path
    end

    it 'should return status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'should return html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end

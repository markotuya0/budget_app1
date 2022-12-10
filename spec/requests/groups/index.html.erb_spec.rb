require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jhon', email: 'Jhon@mail.com', password: '123456') }
  let(:group) { Group.create(name: 'Buy', icon: 'icon', author_id: user.id) }

  describe 'GET /index' do
    before do
      sign_in user
      get groups_path
    end

    it 'should return status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'should return html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end

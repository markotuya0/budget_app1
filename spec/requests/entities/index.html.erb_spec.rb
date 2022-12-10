require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jhon', email: 'Jhon@mail.com', password: '123456') }
  let(:group) { Group.create(name: 'Buy', icon: 'icon', author_id: user.id) }
  let(:entity) { Entity.create(name: 'Banana', amount: 102, author_id: user.id, group_id: group.id) }

  describe 'GET /index' do
    before do
      sign_in user
      get group_entities_path(group)
    end

    it 'should return status correct (ok)' do
      expect(response).to have_http_status('200')
    end

    it 'should return html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end

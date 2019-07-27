# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::UserIpsController do
  describe 'get user ips single route', type: :request do
    let!(:first_post) { create(:post, user: first_user, user_ip: user_ip) }
    let!(:second_post) { create(:post, user: second_user, user_ip: user_ip) }
    let(:user_ip) { create(:user_ip, ip: '8.8.8.8') }
    let(:first_user) { create(:user, username: 'Anton') } # username sorting sensitive
    let(:second_user) { create(:user, username: 'Boris') } # username sorting sensitive
    let(:result) do
      { 'ip' => user_ip.ip, 'users' => [first_user.username, second_user.username] }
    end

    before { get '/api/v1/user_ips/single/' }

    it 'returns usernames of authors posted from single ip' do
      expect(JSON.parse(response.body)).to include(result)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end

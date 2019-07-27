# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::RatesController do
  describe 'create post route', type: :request do
    let!(:post_instance) { FactoryBot.create(:post, user: create(:user), user_ip: create(:user_ip)) }
    let!(:old_rate_instance) { FactoryBot.create(:rate, post_id: post_instance.id, value: post_instance.rating) }
    let(:value) { rand(1..5) }
    let(:new_rating) { ((post_instance.rating + value.to_f) / 2) }
    let(:rate_params) do
      { rate: { post_id: post_instance.id, value: value } }
    end

    before { post '/api/v1/rates/', params: rate_params }

    it 'returns post with updated rating attribute' do
      expect(JSON.parse(response.body)['data']['attributes']).to include('rating' => new_rating)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end

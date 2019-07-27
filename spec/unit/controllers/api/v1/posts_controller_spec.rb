# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::PostsController do
  describe 'get top posts route', type: :request do
    let!(:posts) { FactoryBot.create_list(:post, 20, user: create(:user), user_ip: create(:user_ip)) }
    let!(:random_rate) { Post.all.each { |post| post.update(rating: rand(1..5)) } }

    before { get '/api/v1/posts/top?n=3' }

    it 'returns top 3 rating posts' do
      expect(JSON.parse(response.body)['data'].size).to eq(3)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'create post route', type: :request do
    let(:post_params) do
      { post: { username: 'user1',
                title: 'title2',
                content: 'content3',
                user_ip: '4.4.4.4' } }
    end

    before { post '/api/v1/posts/', params: post_params }

    it 'returns created post' do
      expect(JSON.parse(response.body)['data']['attributes']).to include('title' => 'title2', 'content' => 'content3')
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end

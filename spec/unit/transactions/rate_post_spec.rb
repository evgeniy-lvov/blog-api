# frozen_string_literal: true

require 'rails_helper'

describe RatePost do
  context 'validate' do
    context 'validation is successful' do
      let(:input) { { post_id: '1', value: '2' } }

      it 'step succeeds' do
        result = subject.validate(input)
        expect(result).to be_success
        expect(result.value!).to eq(input)
      end
    end

    context 'validation fails' do
      let(:input) {}

      it 'step fails' do
        result = subject.validate(input)
        expect(result).to be_failure
        expect(result.failure).to eq(post_id: ['is missing'], value: ['is missing'])
      end
    end
  end

  context 'rate create' do
    let(:input) { { post_id: post.id, value: 5 } }
    let(:user) { create(:user) }
    let(:user_ip) { create(:user_ip) }
    let(:post) { create(:post, user: user, user_ip: user_ip) }

    it 'step succeeds' do
      result = subject.rate_create(input)
      expect(result).to be_success
      expect(result.value!).to eq(post)
    end

    let(:error_input) { { post_id: 10, value: 5 } }

    it 'post does not exist' do
      result = subject.rate_create(error_input)
      expect(result).to be_failure
      expect(result.failure).to eq(post_id: ['post id is not found'])
    end
  end

  context 'update post rating' do
    let(:user) { create(:user) }
    let(:user_ip) { create(:user_ip) }
    let(:post) { create(:post, user: user, user_ip: user_ip) }
    let!(:start_rate) { create(:rate, post: post, value: post.rating) }
    let!(:new_rate) { create(:rate, post: post) }

    it 'step succeeds' do
      result = subject.update_post_rating(post)
      expect(result).to be_success
      expect(result.value!.rating).to eq((start_rate.value + new_rate.value).to_f / 2)
    end
  end
end

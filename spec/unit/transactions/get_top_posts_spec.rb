# frozen_string_literal: true

require 'rails_helper'

describe GetTopPosts do
  context 'validate' do
    context 'validation is successful' do
      let(:input) { { n: '3' } }

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
        expect(result.failure).to eq(n: ['is missing'])
      end
    end
  end

  context 'get' do
    let(:input) { { n: 1 } }
    let(:user) { create(:user) }
    let(:user_ip) { create(:user_ip) }
    let(:post) { create(:post, user: user, user_ip: user_ip) }

    it 'step succeeds' do
      result = subject.get(input)
      expect(result).to be_success
      expect(result.value!).to contain_exactly(post)
    end
  end
end

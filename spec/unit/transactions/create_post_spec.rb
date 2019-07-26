# frozen_string_literal: true

require 'rails_helper'

describe CreatePost do
  context 'validate' do
    context 'validation is successful' do
      let(:input) do
        { username: 'username1337',
          title: 'title1337',
          content: 'content1337',
          user_ip: '8.8.8.8' }
      end

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
        expect(result.failure).to eq(username: ['is missing'],
                                     title: ['is missing'],
                                     content: ['is missing'],
                                     user_ip: ['is missing'])
      end
    end
  end
  context 'persist' do
    let(:input) do
      { username: 'best_username',
        title: 'best_title',
        content: 'best_content',
        user_ip: '127.0.0.1' }
    end

    it 'step succeeds' do
      result = subject.persist(input)
      expect(result).to be_success
      expect(result.value!.class).to eq(Post)
    end
  end
end

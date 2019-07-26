# frozen_string_literal: true

module Api
  module V1
    class RatesController < ApplicationController
      def create
        transaction = RatePost.new
        transaction.call(rate_params) do |result|
          result.success do |post|
            serializer = PostSerializer.new(post, fields: { post: [:rating] })
            render json: serializer.serialized_json, status: 200
          end

          result.failure do |errors|
            render json: errors, status: 422
          end
        end
      end

      private

      def rate_params
        params.require(:rate).permit(:post_id, :value).to_h
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def top
        transaction = GetTopPosts.new
        transaction.call(top_param) do |result|
          result.success do |posts|
            serializer = PostSerializer.new(posts, fields: { post: %i[title content] })
            render json: serializer.serialized_json, status: 200
          end

          result.failure :validate do |errors|
            render json: errors, status: 422
          end
        end
      end

      def create
        transaction = CreatePost.new
        transaction.call(post_params) do |result|
          result.success do |post|
            render json: PostSerializer.new(post).serialized_json, status: 200
          end

          result.failure :validate do |errors|
            render json: errors, status: 422
          end
        end
      end

      private

      def post_params
        params.require(:post).permit(:username, :title, :content, :user_ip).to_h
      end

      def top_param
        params.permit!.to_h
      end
    end
  end
end

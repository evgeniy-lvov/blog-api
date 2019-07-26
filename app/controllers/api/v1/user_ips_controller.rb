# frozen_string_literal: true

module Api
  module V1
    class UserIpsController < ApplicationController
      def single
        render json: UserIps::GetSingleIpsUsersPostedFromQuery.call, status: 200
      end
    end
  end
end

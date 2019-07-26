# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :user_ip
  has_many :rates, dependent: :destroy
  delegate :username, to: :user
end

# frozen_string_literal: true

class UserIp < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_and_belongs_to_many :users
end

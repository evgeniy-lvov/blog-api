# frozen_string_literal: true

class CreateJoinTableUserIpUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :user_ips, :users do |t|
      t.index %i[user_ip_id user_id]
      t.index %i[user_id user_ip_id]
    end
  end
end

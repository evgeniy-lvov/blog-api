# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user_ip, index: true, foreign_key: true
      t.float :rating, default: 0.0
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
    add_index :posts, :rating
  end
end

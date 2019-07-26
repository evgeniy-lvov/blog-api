# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :value
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end

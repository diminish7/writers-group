# frozen_string_literal: true

class AddAuthenticationTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.text :authentication_token, index: { unique: true }
      t.datetime :authentication_token_created_at
    end
  end
end

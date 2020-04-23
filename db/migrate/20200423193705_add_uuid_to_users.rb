# frozen_string_literal: true

class AddUuidToUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'

    change_table :users, bulk: true do |t|
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()'
      t.index :uuid, unique: true
    end
  end
end

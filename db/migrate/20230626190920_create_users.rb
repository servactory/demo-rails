# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false

      t.timestamps
    end
  end
end

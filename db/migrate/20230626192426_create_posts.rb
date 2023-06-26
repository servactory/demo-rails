# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :blog, null: false, foreign_key: true
      t.belongs_to :author, null: true, foreign_key: { to_table: :users }

      t.string :title, null: false

      t.timestamps
    end
  end
end

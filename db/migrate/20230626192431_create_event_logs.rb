# frozen_string_literal: true

class CreateEventLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :event_logs do |t|
      t.string :code, null: false
      t.string :status, null: false, default: :created

      t.timestamps
    end
  end
end

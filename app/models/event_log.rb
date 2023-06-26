# frozen_string_literal: true

# == Schema Information
#
# Table name: event_logs
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  status     :string           default("created"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EventLog < ApplicationRecord
  validates :code, presence: true
  validates :status, presence: true
end

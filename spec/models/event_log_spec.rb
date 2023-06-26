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
require "rails_helper"

RSpec.describe EventLog do
  pending "add some examples to (or delete) #{__FILE__}"
end

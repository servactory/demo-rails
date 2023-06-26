# frozen_string_literal: true

class EventLogsService::Create < ApplicationService::Base
  input :code, type: Symbol

  output :event_log, type: EventLog

  make :create!

  def create!
    outputs.event_log = EventLog.create!(code: inputs.code, status: :created)
  end
end

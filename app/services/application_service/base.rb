# frozen_string_literal: true

class ApplicationService::Base < Servactory::Base
  configuration do
    input_error_class ApplicationService::Errors::InputError
    output_error_class ApplicationService::Errors::OutputError
    internal_error_class ApplicationService::Errors::InternalError

    failure_class ApplicationService::Errors::Failure
  end
end

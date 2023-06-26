# frozen_string_literal: true

class UsersService::Create < ApplicationService::Base
  input :first_name, type: String
  input :middle_name, type: String, default: nil
  input :last_name, type: String

  output :user, type: User

  make :create!

  def create!
    outputs.user = User.create!(
      first_name: inputs.first_name,
      middle_name: inputs.middle_name,
      last_name: inputs.last_name
    )
  end
end

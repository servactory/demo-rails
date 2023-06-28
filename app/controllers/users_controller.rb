# frozen_string_literal: true

class UsersController < ApplicationController
  def create_with_preview
    UsersService::CreateWithPreview.call!(
      first_name: Faker::Name.first_name,
      middle_name: Faker::Name.middle_name,
      last_name: Faker::Name.last_name
    )

    render json: :ok
  end
end

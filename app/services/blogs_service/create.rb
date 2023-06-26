# frozen_string_literal: true

class BlogsService::Create < ApplicationService::Base
  input :user, type: User
  input :title, type: String

  output :blog, type: Blog

  make :create!

  def create!
    outputs.blog = Blog.create!(
      user: inputs.user,
      title: inputs.title
    )
  end
end

# frozen_string_literal: true

class PostsService::Create < ApplicationService::Base
  input :blog, type: Blog
  input :author, type: User
  input :title, type: String

  output :post, type: Post

  make :create!

  def create!
    outputs.post = Post.create!(
      blog: inputs.blog,
      author: inputs.author,
      title: inputs.title
    )
  end
end

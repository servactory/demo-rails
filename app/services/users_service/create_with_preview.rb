# frozen_string_literal: true

class UsersService::CreateWithPreview < ApplicationService::Base
  input :first_name, type: String
  input :middle_name, type: String, default: nil
  input :last_name, type: String

  internal :event_log, type: EventLog

  internal :user, type: User
  internal :blog, type: Blog
  internal :post, type: Post

  make :create_event_log!

  stage do
    wrap_in ->(methods:, **) { ActiveRecord::Base.transaction { methods.call } }
    rollback :clear_data_and_fail!

    make :create_user!
    make :create_blog_for_user!
    make :create_post_for_user_blog!
  end

  make :complete_event_log!

  def create_event_log!
    internals.event_log = EventLogsService::Create.call!(code: :user_with_preview).event_log
  end

  def create_user!
    internals.user = UsersService::Create.call!(
      first_name: inputs.first_name,
      middle_name: inputs.middle_name,
      last_name: inputs.last_name
    ).user
  end

  def create_blog_for_user!
    internals.blog = BlogsService::Create.call!(
      user: internals.user,
      title: "My Blog"
    ).blog
  end

  def create_post_for_user_blog!
    internals.post = PostsService::Create.call!(
      blog: internals.blog,
      author: internals.user,
      title: "My first post!"
    ).post
  end

  def complete_event_log!
    internals.event_log.update!(status: :completed)
  end

  def clear_data_and_fail!(_exception)
    internals.event_log.update!(status: :failed)

    fail!(message: "Failed to create preview")
  end
end

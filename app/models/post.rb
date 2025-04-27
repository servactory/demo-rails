# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#  blog_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_blog_id    (blog_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (blog_id => blogs.id)
#
class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :author, class_name: "User", inverse_of: :posts

  validates :title, presence: true
end

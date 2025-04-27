# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :posts, foreign_key: :author_id, inverse_of: :author, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end

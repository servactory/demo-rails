# frozen_string_literal: true

RSpec.describe PostsService::Create do
  let(:user) { create :user }

  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        blog: blog,
        author: author,
        title: title
      }
    end

    let(:blog) { create :blog, user: user }
    let(:author) { user }
    let(:title) { Faker::Lorem.sentence }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes: attributes)

          expect(result.post).to eq(Post.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      context "when `blog`" do
        it_behaves_like "input required check", name: :blog
        it_behaves_like "input type check", name: :blog, expected_type: Blog
      end

      context "when `author`" do
        it_behaves_like "input required check", name: :author
        it_behaves_like "input type check", name: :author, expected_type: User
      end

      context "when `title`" do
        it_behaves_like "input required check", name: :title
        it_behaves_like "input type check", name: :title, expected_type: String
      end
    end
  end
end

# frozen_string_literal: true

RSpec.describe PostsService::Create do
  let(:user) { create(:user) }

  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        blog:,
        author:,
        title:
      }
    end

    let(:blog) { create(:blog, user:) }
    let(:author) { user }
    let(:title) { Faker::Lorem.sentence }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes:)

          expect(result.post).to eq(Post.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      it do
        expect { perform(attributes:) }.to(
          have_input(:blog)
            .type(Blog)
            .required
        )
      end

      it do
        expect { perform(attributes:) }.to(
          have_input(:author)
            .type(User)
            .required
        )
      end

      it do
        expect { perform(attributes:) }.to(
          have_input(:title)
            .type(String)
            .required
        )
      end
    end
  end
end

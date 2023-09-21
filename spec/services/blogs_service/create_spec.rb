# frozen_string_literal: true

RSpec.describe BlogsService::Create do
  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        user: user,
        title: title
      }
    end

    let(:user) { create(:user) }
    let(:title) { Faker::Lorem.sentence }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes: attributes)

          expect(result.blog).to eq(Blog.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      context "when `user`" do
        it_behaves_like "input required check", name: :user
        it_behaves_like "input type check", name: :user, expected_type: User
      end

      context "when `title`" do
        it_behaves_like "input required check", name: :title
        it_behaves_like "input type check", name: :title, expected_type: String
      end
    end
  end
end

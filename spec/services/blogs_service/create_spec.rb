# frozen_string_literal: true

RSpec.describe BlogsService::Create do
  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        user:,
        title:
      }
    end

    let(:user) { create(:user) }
    let(:title) { Faker::Lorem.sentence }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes:)

          expect(result.blog).to eq(Blog.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      it do
        expect { perform(attributes:) }.to(
          have_input(:user)
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

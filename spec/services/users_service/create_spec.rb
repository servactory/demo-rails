# frozen_string_literal: true

RSpec.describe UsersService::Create do
  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        first_name:,
        middle_name:,
        last_name:
      }
    end

    let(:first_name) { Faker::Name.first_name }
    let(:middle_name) { Faker::Name.middle_name }
    let(:last_name) { Faker::Name.last_name }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes:)

          expect(result.user).to eq(User.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      it do
        expect { perform(attributes:) }.to(
          have_input(:first_name)
            .type(String)
            .required
        )
      end

      it do
        expect { perform(attributes:) }.to(
          have_input(:middle_name)
            .type(String)
            .required
            .default(nil)
        )
      end

      it do
        expect { perform(attributes:) }.to(
          have_input(:last_name)
            .type(String)
            .required
        )
      end
    end
  end
end

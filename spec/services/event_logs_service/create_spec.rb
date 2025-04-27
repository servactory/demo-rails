# frozen_string_literal: true

RSpec.describe EventLogsService::Create do
  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        code:
      }
    end

    let(:code) { Faker::Lorem.word.to_sym }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes:)

          expect(result.event_log).to eq(EventLog.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      it do
        expect { perform(attributes:) }.to(
          have_input(:code)
            .type(Symbol)
            .required
        )
      end
    end
  end
end

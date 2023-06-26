# frozen_string_literal: true

RSpec.describe EventLogsService::Create do
  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        code: code
      }
    end

    let(:code) { Faker::Lorem.word.to_sym }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "returns expected data" do
          result = perform(attributes: attributes)

          expect(result.event_log).to eq(EventLog.sole)
        end
      end
    end

    context "when the input arguments are invalid" do
      context "when `code`" do
        it_behaves_like "input required check", name: :code
        it_behaves_like "input type check", name: :code, expected_type: Symbol
      end
    end
  end
end

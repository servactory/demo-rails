# frozen_string_literal: true

RSpec.describe UsersService::CreateWithPreview do
  describe ".call" do
    def perform(attributes:)
      described_class.call(**attributes)
    end

    let(:attributes) do
      {
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name
      }
    end

    let(:first_name) { Faker::Name.first_name }
    let(:middle_name) { Faker::Name.middle_name }
    let(:last_name) { Faker::Name.last_name }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        it "creates expected record" do
          expect { perform(attributes: attributes) }.to(
            change(EventLog, :count).from(0).to(1) &&
              change(User, :count).from(0).to(1) &&
              change(Blog, :count).from(0).to(1) &&
              change(Post, :count).from(0).to(1)
          )
        end

        it "returns expected status" do
          perform(attributes: attributes)

          expect(EventLog.sole.status).to eq("completed")
        end
      end

      describe "but the data required for work is invalid" do
        describe "because an empty `first_name` is passed" do
          let(:first_name) { " " }

          it "creates expected record" do
            expect { perform(attributes: attributes) }.not_to(
              change(User, :count) &&
                change(Blog, :count) &&
                change(Post, :count)
            )
          end

          it "returns expected status" do
            perform(attributes: attributes)

            expect(EventLog.sole.status).to eq("failed")
          end
        end
      end
    end

    context "when the input arguments are invalid" do
      context "when `first_name`" do
        it_behaves_like "input required check", name: :first_name
        it_behaves_like "input type check", name: :first_name, expected_type: String
      end

      context "when `middle_name`" do
        it_behaves_like "input type check", name: :middle_name, expected_type: String
      end

      context "when `last_name`" do
        it_behaves_like "input required check", name: :last_name
        it_behaves_like "input type check", name: :last_name, expected_type: String
      end
    end
  end
end

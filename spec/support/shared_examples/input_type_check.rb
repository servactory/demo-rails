# frozen_string_literal: true

RSpec.shared_examples "input type check" do |name:, expected_type:, array: false, array_message: nil|
  describe "is of the wrong type" do
    let(name) { array ? Array(Servactory::TestKit::FakeType.new) : Servactory::TestKit::FakeType.new }

    it "returns expected error" do
      expect { perform(attributes: attributes) }.to(
        raise_input_error_for(
          check_name: :type,
          name: name,
          service_class_name: described_class.name,
          array: array,
          array_message: array_message,
          expected_type: expected_type,
          given_type: Servactory::TestKit::FakeType
        )
      )
    end
  end
end

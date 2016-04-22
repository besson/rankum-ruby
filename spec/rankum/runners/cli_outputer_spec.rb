require_relative "../../../lib/rankum/runners/cli_outputer"

module Rankum
  module Runners
    describe CLIOutputer do

      context "when has a result value" do
        it "should round value" do
          result = CLIOutputer.call(value: 0.4242)

          expect(result).to be_a_success
          expect(result.value).to eq(42.42)
        end
      end

      context "when result is nil" do
        it "should fail" do
          result = CLIOutputer.call
          expect(result).to be_a_failure
        end
      end

    end
  end
end

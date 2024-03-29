require_relative "../../../lib/rankum/runners/cli_outputer"

module Rankum
  module Runners
    describe CLIOutputer do

      context "when has a result value" do
        it "should round value" do
          result = CLIOutputer.run(value: 0.4242)

          expect(result).to be_a_success
          expect(result.value).to eq(42.42)
        end

        it "should return output lines" do
          result = CLIOutputer.run(value: 0.4242, metric: "FCP")
          output = result.output

          expect(result).to be_a_success
          expect(output[0]).to eq("Rankum")
          expect(output[1]).to match(/-.*/)
          expect(output[2]).to match(/Metric: [\s|\S].*/)
          expect(output[3]).to eq("Similarity: #{Paint["42.42 %", :red, :bright]}")
        end
      end

      context "when result is nil" do
        it "should fail" do
          result = CLIOutputer.run
          expect(result).to be_a_fail
        end
      end

    end
  end
end

require_relative "../../../lib/rankum/metrics/fcp_calculator"
require_relative "../../../lib/rankum/utils/fcp_pair"

module Rankum
  module Metrics
    describe FCPCalculator do
      let(:perfect_rank) { ["A", "B", "C", "D", "E"] }
      let(:reader) do
        double("rank_reader", :perfect_rank => perfect_rank, :actual_rank => actual_rank)
      end

      context "when actual rank is equal to perfect rank" do
        let(:actual_rank) { perfect_rank }

        it "should get 1.0 as FCP value" do
          calculator = FCPCalculator.call(rank_reader: reader)
          expect(calculator).to be_a_success
          expect(calculator.value).to eq(1.0)
        end
      end

      context "when actual rank is totally different from the perfect one" do
        let(:actual_rank) { ["F", "G", "H", "I", "J"] }

        it "should get 0 as FCP value" do
          calculator = FCPCalculator.call(rank_reader: reader)
          expect(calculator).to be_a_success
          expect(calculator.value).to eq(0)
        end
      end

      context "when actual rank is the reversed from the perfect one" do
        let(:actual_rank) { ["E", "D", "C", "B", "A"] }

        it "should get 0 as FCP value" do
          calculator = FCPCalculator.call(rank_reader: reader)
          expect(calculator).to be_a_success
          expect(calculator.value).to eq(0)
        end
      end

      context "when some pairs are incorrect" do
        let(:actual_rank) { ["B", "A", "C", "E", "D"] }

        it "should get 0.8 as FCP value" do
          calculator = FCPCalculator.call(rank_reader: reader)
          expect(calculator).to be_a_success
          expect(calculator.value).to eq(0.8)
        end
      end

    end
  end
end
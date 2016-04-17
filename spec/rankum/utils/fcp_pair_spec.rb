require_relative "../../../lib/rankum/utils/fcp_pair"

module Rankum
  module Utils
    describe FCPPair do

      context "when receiving a rank as an array" do
        let(:rank) { ["A", "B", "C", "D", "E"] }
        let(:pairs) { [ Pair.new("A","B"), Pair.new("A","C"), Pair.new("A","D"), Pair.new("A", "E"),
                        Pair.new("B","C"), Pair.new("B","D"), Pair.new("B", "E"),
                        Pair.new("C","D"), Pair.new("C","E"),
                        Pair.new("D", "E") ] }

        it "should return an array of pairs" do
          expect(FCPPair.build_from_array(rank)).to eq(pairs)
        end
      end

    end
  end
end

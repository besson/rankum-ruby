require_relative "../../../lib/rankum/utils/fcp_pair"

module Rankum
  module Utils
    describe FCPPair do

      context "when receiving a rank as an array" do
        let(:rank) { ["A", "A", "C", "D", "E"] }
        let(:pair_array) { [ Pair.new("A","A"), Pair.new("A","C"), Pair.new("A","D"), Pair.new("A", "E"),
                        Pair.new("A","C"), Pair.new("A","D"), Pair.new("A", "E"),
                        Pair.new("C","D"), Pair.new("C","E"),
                        Pair.new("D", "E") ] }

        let(:pair_hash) do
          { Pair.new("A","A") => 1,
            Pair.new("A","C") => 2,
            Pair.new("A","D") => 2,
            Pair.new("A", "E") => 2,
            Pair.new("C","D") => 1,
            Pair.new("C","E") => 1,
            Pair.new("D", "E") => 1 }
        end

        it "should return an array of pairs" do
          expect(FCPPair.to_a(rank)).to eq(pair_array)
        end

        it "should return a hash of pair occurences" do
          expect(FCPPair.to_h(rank)).to eq(pair_hash)
        end
      end

    end
  end
end

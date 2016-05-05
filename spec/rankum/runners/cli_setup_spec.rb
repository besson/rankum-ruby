require_relative "../../../lib/rankum/runners/cli_setup"

module Rankum
  module Runners
    describe CLISetup do

      context "when receiving valid parameters" do
        let(:cli_params) do
          {
            metric: "fcp",
            rank_reader: "RankFileReader",
            perfect_rank: "spec/fixtures/perfect_rank.txt",
            actual_rank: "spec/fixtures/actual_rank.txt"
          }
        end

        it "should set up parameters" do
          result = CLISetup.call(cli_params)

          expect(result).to be_a_success
          expect(result.rank_reader).to be_a_kind_of(Rankum::Readers::RankFileReader)
        end

        it "should add ranks to rank file reader" do
          reader = CLISetup.call(cli_params).rank_reader
          list = ("A".."Z").to_a
          reversed_list = ("A".."Z").to_a.reverse

          expect(reader.perfect_rank).to eq(list)
          expect(reader.actual_rank).to eq(reversed_list)
        end
      end
    end
  end
end


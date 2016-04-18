require_relative "../../../lib/rankum/readers/rank_file_reader"

module Rankum
  module Readers
    describe RankFileReader do
      let(:subject) { RankFileReader.new }

      context "when adding a path to the perfect rank as a txt file" do
        let(:perfect_rank_path) { "spec/fixtures/perfect_rank.txt" }
        before { subject.add_perfect_rank_path(perfect_rank_path) }

        it "should convert to a list" do
          expect(subject.perfect_rank).to eq(("A".."Z").to_a)
        end
      end

      context "when adding a path to the actual rank as a txt file" do
        let(:actual_rank_path) { "spec/fixtures/actual_rank.txt" }
        before { subject.add_actual_rank_path(actual_rank_path) }

        it "should convert to a list" do
          expect(subject.actual_rank).to eq(("A".."Z").to_a.reverse)
        end
      end

    end
  end
end


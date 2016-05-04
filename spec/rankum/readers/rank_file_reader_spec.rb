require_relative "../../../lib/rankum/readers/rank_file_reader"

module Rankum
  module Readers
    describe RankFileReader do
      let(:subject) { RankFileReader.new }

      context "when adding a path to the perfect rank as a txt file" do
        let(:perfect_rank_path) { "spec/fixtures/perfect_rank.txt" }
        before { subject.add_perfect_rank_path(perfect_rank_path) }

        it "should convert to a list" do
          expect(subject.perfect_rank).to be_a_kind_of(Array)
        end

        it "should add position number to each item rank" do
          expected_list = ("A".."Z").each_with_index.map {|item, i| "#{i}#{item}"}
          expect(subject.perfect_rank).to eq(expected_list)
        end
      end

      context "when adding a path to the actual rank as a txt file" do
        let(:actual_rank_path) { "spec/fixtures/actual_rank.txt" }
        before { subject.add_actual_rank_path(actual_rank_path) }

        it "should convert to a list" do
          expect(subject.actual_rank).to be_a_kind_of(Array)
        end

        it "should add position number to each item rank" do
          expected_list = ("A".."Z").to_a.reverse.each_with_index.map {|item, i| "#{i}#{item}"}
          expect(subject.actual_rank).to eq(expected_list)
        end
      end

      context "when has repeated pairs" do
        let(:rank_path) { "spec/fixtures/repeated_rank.txt" }
        before { subject.add_perfect_rank_path(rank_path) }
        let(:expected_list) { ["0hot", "1hot", "2fresh", "3vip", "4piv"] }

        it "should returned a ordered list" do
          expect(subject.perfect_rank).to eq(expected_list)
        end
      end

    end
  end
end


require_relative "../utils/fcp_pair"
require_relative "../utils/interactor"

module Rankum
  module Metrics
    class FCPCalculator
      include Rankum::Utils::Interactor

      def self.run context
        FCPCalculator.new(context).run
      end

      def run
        execute { context.value = calculate_fcp }
      end

      private
      def perfect_rank_pairs
        @perfect_rank_pairs ||= Rankum::Utils::FCPPair.to_h(perfect_rank)
      end

      def actual_rank_pairs
        @actual_rank_pairs ||= Rankum::Utils::FCPPair.to_a(actual_rank)
      end

      def calculate_fcp
        total_pairs = perfect_rank_pair_count

        actual_rank_pairs.each do |pair|
          if perfect_rank_pairs[pair] > 0
            perfect_rank_pairs[pair] -= 1
          end
        end

        not_matched_pairs = perfect_rank_pair_count
        result = (total_pairs - not_matched_pairs).to_f / total_pairs
        result > 0 ? result : 0
      end

      def perfect_rank_pair_count
        perfect_rank_pairs.reduce(0) { |acc, (k,v)| acc += v }
      end

      def rank_reader
        @reader ||= context.rank_reader
      end

      def perfect_rank
        @perfect_rank ||= rank_reader.perfect_rank
      end

      def actual_rank
        @actual_rank ||= rank_reader.actual_rank
      end

    end
  end
end

require "interactor"

require_relative "../utils/fcp_pair"

module Rankum
  module Metrics
    class FCPCalculator
      include Interactor

      def call
        build_perfect_rank_pairs
        build_actual_rank_pairs
        calculate_fcp
      end

      private
      def build_perfect_rank_pairs
        @perfect_rank_pairs ||= Rankum::Utils::FCPPair.build_from_array(perfect_rank)
      end

      def build_actual_rank_pairs
        @actual_rank_pairs ||= Rankum::Utils::FCPPair.build_from_array(actual_rank)
      end

      def calculate_fcp
        total_pairs = @perfect_rank_pairs.count
        differences = (@perfect_rank_pairs - @actual_rank_pairs).count
        context.value = (total_pairs - differences).to_f / total_pairs.to_f
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

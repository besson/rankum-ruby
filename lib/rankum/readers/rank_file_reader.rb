module Rankum
  module Readers
    class RankFileReader

      def initialize
        @perfect_rank = []
        @actual_rank = []
      end

      def add_perfect_rank_path path
        @perfect_rank = [] unless @perfect_rank.empty?
        @perfect_rank = to_array(path)
      end

      def add_actual_rank_path path
        @actual_rank = [] unless @actual_rank.empty?
        @actual_rank = to_array(path)
      end

      def perfect_rank
        @perfect_rank
      end

      def actual_rank
        @actual_rank
      end

      private
      def to_array rank_path
         IO.readlines(rank_path).map { |item| item.strip}
      end

    end
  end
end

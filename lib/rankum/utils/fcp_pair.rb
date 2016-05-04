module Rankum
  module Utils
    module FCPPair

      class Rankum::Utils::Pair < Struct.new(:actual, :next); end

      def self.build_from_array(rank)
        rank.each_with_index.inject([]) do |pairs, (item, idx)|
          rank[(idx + 1)..-1].each { |next_item| pairs << Pair.new(item, next_item) }
          pairs
        end
      end

    end
  end
end

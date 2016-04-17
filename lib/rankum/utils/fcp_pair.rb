module Rankum
  module Utils
    module FCPPair

      class Rankum::Utils::Pair < Struct.new(:previous, :next); end

      def self.build_from_array(rank)
        rank.each_with_index.inject([]) do |pairs, (item, idx)|
          rank[(idx + 1)..-1].each { |i| pairs << Pair.new(item, i) }
          pairs
        end
      end

    end
  end
end

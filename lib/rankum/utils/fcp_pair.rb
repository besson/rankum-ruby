module Rankum
  module Utils
    module FCPPair

      class Rankum::Utils::Pair < Struct.new(:actual, :next); end

      def self.to_a(rank)
        rank.each_with_index.inject([]) do |pairs, (item, idx)|
          rank[(idx + 1)..-1].each { |next_item| pairs << Pair.new(item, next_item) }
          pairs
        end
      end

      def self.to_h(rank)
        to_a(rank).inject(Hash.new(0)) do |pairs, item|
          pairs[item] += 1
          pairs
        end
      end

    end
  end
end

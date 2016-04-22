require "interactor"
require 'paint'

module Rankum
  module Runners
    class CLIOutputer
      include Interactor

      def call
        context.fail! unless raw_value
        context.value = round(raw_value)
        outputs
      end

      private
      def raw_value
        @raw_value ||= context.value
      end

      def round value
        (value * 100).round(2)
      end

      def outputs
        color = raw_value > 0.7 ? :green : :red
        puts "Similarity: #{Paint["#{context.value} %", color, :bright]}"
      end
    end
  end
end

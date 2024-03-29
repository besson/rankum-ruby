require_relative "../utils/interactor"
require 'paint'

module Rankum
  module Runners
    class CLIOutputer
      include Rankum::Utils::Interactor

      def self.run context={}
        CLIOutputer.new(context).run
      end

      def run
        execute do
          fail! unless raw_value
          context.value = round(raw_value)
          context.output = output
        end
      end

      private
      def raw_value
        @raw_value ||= context.value
      end

      def round value
        (value * 100).round(2)
      end

      def output
        lines = []
        lines << "Rankum"
        lines << "------------"
        lines << "Metric: #{context.metric}"

        color = raw_value > 0.7 ? :green : :red
        lines << "Similarity: #{Paint["#{context.value} %", color, :bright]}"
        lines
      end

    end
  end
end

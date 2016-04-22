require "interactor"

module Rankum
  module Runners
    class CLIOutputer
      include Interactor

      def call
        context.fail! unless raw_value
        context.value = round(raw_value)
      end

      private
      def raw_value
        @raw_value ||= context.value
      end

      def round value
        (value * 100).round(2)
      end
    end
  end
end

require_relative "../metrics/fcp_calculator"
require_relative "cli_setup"
require_relative "cli_outputer"

module Rankum
  module Runners
    class RankumCLI
      include Rankum::Utils::Interactor

      def self.run context
        RankumCLI.new(context).run
      end

      def run
        organize Rankum::Runners::CLISetup,
                 Rankum::Metrics::FCPCalculator,
                 Rankum::Runners::CLIOutputer
      end

    end
  end
end

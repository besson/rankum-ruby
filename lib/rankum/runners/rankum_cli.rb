require "interactor"
require_relative "../metrics/fcp_calculator"
require_relative "cli_setup"
require_relative "cli_outputer"

module Rankum
  module Runners
    class RankumCLI
      include Interactor::Organizer

      organize Rankum::Runners::CLISetup,
               Rankum::Metrics::FCPCalculator,
               Rankum::Runners::CLIOutputer
    end
  end
end
require "interactor"
require_relative "../metrics/fcp_calculator"
require_relative "cli_setup"

module Rankum
  module Runners
    class RankumCLI
      include Interactor::Organizer

      organize Rankum::Runners::CLISetup,
               Rankum::Metrics::FCPCalculator
    end
  end
end

require "interactor"
require_relative "metrics/fcp_calculator"
require_relative "readers/rank_file_reader"

module Rankum
  class CLISetup
    include Interactor

    def call
      context.metric_calculator = ::Rankum::Metrics::FCPCalculator
      context.rank_reader = rank_reader
    end

    private
    def rank_reader
      reader = Object::const_get("::Rankum::Readers::#{context.rank_reader}").new

      reader.add_perfect_rank_path(context.perfect_rank)
      reader.add_actual_rank_path(context.actual_rank)

      reader
    end

  end
end

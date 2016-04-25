require "mixlib/cli"
require_relative "rankum/runners/rankum_cli"

module Rankum
  class CLI
    include Mixlib::CLI

    option :metric,
      :short => "-m metric",
      :long  => "--metric metric",
      :default => "fcp",
      :description => "Metric used to compare search ranks"

    option :rank_reader,
      :short => "-r rank_reader",
      :long  => "--rank_reader rank_reader",
      :default => "RankFileReader",
      :description => "Strategy to to read your ranks"

    option :perfect_rank,
      :short => "-p perfect_rank_file_path",
      :long  => "--perfect_rank perfect_rank_file_path",
      :description => "Perfect Rank file (only valid for RankFileReader strategy)"

    option :actual_rank,
      :short => "-a actual rank_file_path",
      :long  => "--actual_rank actual_rank_file_path",
      :description => "Actual Rank file (only valid for RankFileReader strategy)"
  end
 end

cli = Rankum::CLI.new
cli.parse_options

result = Rankum::Runners::RankumCLI.call(cli.config)

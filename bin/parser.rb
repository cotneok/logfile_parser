# frozen_string_literal: true

require './lib/entry_sorter'
require './lib/logfile_parser'
require_relative './command_line_handler'

arg_parser = Validate::Cli::FilePath.new(ARGV[0])
file_path = arg_parser.validate_entry
file_parser = LogfileParser.read_file(file_path)
entry_sorter = EntrySorter.new(file_parser.entries)

entry_sorter.sort(unique: false/true).each do |entry|
  puts "#{entry[0]} #{entry[1]} views"
end

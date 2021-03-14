# frozen_string_literal: true

class LogfileParser
  attr_accessor :filename
  attr_reader   :entries

  def initialize
    @entries = []
  end

  def self.read_file(file_path)
    parser = LogfileParser.new
    File.readlines(file_path).each do |line|
      parser.entries << parse_entry(line)
    end
    parser
  end

  def self.parse_entry(string)
    path, ip = string.split
    ActivityLog.new(path, ip)
  end

  ActivityLog = Struct.new(:path, :ip)
end

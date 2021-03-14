# frozen_string_literal: true

require './lib/logfile_parser'
require 'faker'
require './spec/spec_helper'

describe LogfileParser do
  describe '#new' do
    it 'should have [] entries' do
      expect(LogfileParser.new.entries).to eq([])
    end
  end

  describe '.read_file' do
    it 'should process every entry from the file' do
      lines = [
        '/about_us 15.252.154.207',
        '/customers/1 41.183.34.116'
      ]
      filename = Faker::File.file_name
      allow(File).to receive(:readlines).with(filename).and_return lines

      entries = LogfileParser.read_file(filename).entries

      expect(entries.size).to eq(2)
      expect(entries[0].path).to eq('/about_us')
      expect(entries[0].ip).to eq('15.252.154.207')
      expect(entries[1].path).to eq('/customers/1')
      expect(entries[1].ip).to eq('41.183.34.116')
    end
  end

  describe '.parse_entry' do
    it 'should separate path and ip' do
      log_entry = LogfileParser.parse_entry('/home 240.181.67.173')
      expect(log_entry.path).to eq('/home')
      expect(log_entry.ip).to eq('240.181.67.173')
    end
  end
end

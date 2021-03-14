# frozen_string_literal: true

require './lib/entry_sorter'
require './lib/logfile_parser'
require 'faker'
require './spec/spec_helper'

RSpec.describe EntrySorter do
  before :each do
    activity_log = Struct.new(:path, :ip)

    entries = [
      activity_log.new('/users/2', '52.112.111.92'),
      activity_log.new('/users/2', '52.112.111.92'),
      activity_log.new('/users/2', '52.112.111.92'),
      activity_log.new('/users/2', '52.112.111.92'),
      activity_log.new('/users/2', '107.4.204.107'),
      activity_log.new('/index', '247.36.93.80'),
      activity_log.new('/index', '45.12.93.70'),
      activity_log.new('/index', '3.89.171.48'),
      activity_log.new('/index', '98.111.43.48')
    ]

    @entry_sorter = EntrySorter.new(entries)
  end

  describe '.sort' do
    it 'it should do unique aggregation desc' do
      values = @entry_sorter.sort(unique: true, order: :desc)
      expect(values[0]).to eq ['/index', 4]
      expect(values[1]).to eq ['/users/2', 2]
    end

    it 'it should do unique aggregation asc' do
      values = @entry_sorter.sort(unique: true, order: :asc)
      expect(values[0]).to eq ['/users/2', 2]
      expect(values[1]).to eq ['/index', 4]
    end

    it 'it should do non unique aggregation desc' do
      values = @entry_sorter.sort(unique: false, order: :desc)
      expect(values[0]).to eq ['/users/2', 5]
      expect(values[1]).to eq ['/index', 4]
    end

    it 'it should do non unique aggregation asc' do
      values = @entry_sorter.sort(unique: false, order: :asc)
      expect(values[0]).to eq ['/index', 4]
      expect(values[1]).to eq ['/users/2', 5]
    end
  end
end

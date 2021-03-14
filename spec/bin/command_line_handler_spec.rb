# frozen_string_literal: true

require './bin/command_line_handler'
require 'faker'
require './spec/spec_helper'

RSpec.describe Validate::Cli::FilePath do
  context 'with successfully provided arguments' do
    it 'should return valid file path after providing it' do
      file_path = Faker::File.file_name
      arg = file_path
      cli_parser = Validate::Cli::FilePath.new(arg)
      allow(File).to receive(:exist?).and_return true
      expect(cli_parser.validate_entry).to eq file_path
    end
  end

  context 'with unsuccessfully running arguments' do
    it 'should raise no arguments error' do
      cli_parser = Validate::Cli::FilePath.new(nil)
      expect { cli_parser.validate_entry }.to raise_error Validate::Cli::Errors::NoArguments
    end

    it 'should raise file not found error' do
      file_path = Faker::File.file_name
      arg = "./fake/#{file_path}"
      cli_parser = Validate::Cli::FilePath.new(arg)
      allow(File).to receive(:exist?).and_return false
      expect { cli_parser.validate_entry }.to raise_error Validate::Cli::Errors::FileNotFound
    end
  end
end

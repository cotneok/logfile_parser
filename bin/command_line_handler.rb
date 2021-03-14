# frozen_string_literal: true

module Validate
  module Cli
    class FilePath
      attr_reader :arg, :file_path

      def initialize(arg)
        @arg = arg
        @file_path = ''
      end

      def validate_entry
        raise Errors::NoArguments if arg.nil?

        file_path = arg

        raise Errors::FileNotFound, file_path unless File.exist? file_path

        file_path
      end
    end

    module Errors
      class CommandLineError < StandardError; end

      class FileNotFound < CommandLineError
        def initialize(path)
          super("File or directory with - (#{path}) path doesn't exits")
        end
      end

      class NoArguments < CommandLineError
        def initialize
          super('Please provide file path parameter')
        end
      end
    end
  end
end

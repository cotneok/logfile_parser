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

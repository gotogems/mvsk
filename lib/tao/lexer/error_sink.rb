module Tao
  module Lexer
    class ErrorSink
      attr_reader :errors

      def initialize(scanner)
        @scanner = scanner
        @errors  = []
      end

      def unterminated(_lexeme)
        UnterminatedString.new(pos_get)
          .tap { |error| @errors << error }
      end

      def unexpected(char)
        UnexpectedChar.new(pos_get, char)
          .tap { |error| @errors << error }
      end

      def invalid(str)
        IllegalToken.new(pos_get, str)
          .tap { |error| @errors << error }
      end

      def pos_get
        @scanner.pos.dup
      end
    end
  end
end

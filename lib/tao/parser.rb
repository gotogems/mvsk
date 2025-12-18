module Tao
  class Parser
    extend Forwardable

    def initialize(lexer)
      @lexer   = lexer
      @current = 0
      next_token
      next_token
    end

    def parse_expression(precedence = 0)
    end

    def parse_prefix
    end

    def parse_infix(left)
    end

    def_delegator :@lexer, :next_token
    def_delegator :@lexer, :tokens

    def advance
      @_peek_token = next_token
      @current += 1 unless eof?
      previous
    end

    def previous
      tokens[@current.pred]
    end

    def peek
      tokens[@current]
    end

    def eof?
      peek.eof?
    end
  end
end

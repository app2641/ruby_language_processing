# frozen_string_literal: true

class Ch01
  class Ngram
    attr_accessor :str

    def initialize(str)
      @str = str
    end

    def to_ngram
      @str.chars.each_cons(2).map(&:join)
    end
  end
end
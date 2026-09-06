# frozen_string_literal: true

module Acronym
  def self.abbreviate(phrase)
    result = +""
    in_word = false
    phrase.each_char do |char|
      if char.match? /[[:alpha:]]/
        (result << char; in_word = true) unless in_word
      else
        in_word = false unless char.eql? "'"
      end
    end
    result.upcase!
    result
  end
end

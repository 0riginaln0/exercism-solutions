module Acronym
  def self.abbreviate(phrase)
    phrase
      .gsub("'", "")
      .gsub(/[^A-Za-z]/, " ")
      .split
      .map { |word| word[0] }
      .join
      .upcase
  end
end
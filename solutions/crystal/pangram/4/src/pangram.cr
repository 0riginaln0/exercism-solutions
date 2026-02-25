class Pangram
  def self.pangram?(input : String) : Bool
    alphabet = Hash(Char, Int32).new
    input.downcase.each_char do |char|
      if char.letter?
        alphabet[char] = 1
      end
    end
    if alphabet.size == 26
      true
    else
      false
    end
  end
end

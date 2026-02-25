class Pangram
  def self.pangram?(input : String) : Bool
    input = input.downcase
    ('a'..'z').all? { |c| input.includes?(c) }
  end
end

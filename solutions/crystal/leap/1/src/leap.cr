module Year
  def self.leap?(year : Number) : Bool
    unless divisible_by_100?(year)
      divisible_by_4?(year)
    else
      divisible_by_400?(year)
    end
  end
end

def divisible_by_400?(number : Number) : Bool
  number % 400 == 0
end

def divisible_by_4?(number : Number) : Bool
  number % 4 == 0
end

def divisible_by_100?(number : Number) : Bool
  number % 100 == 0
end

module Year
  def self.leap?(year : Number) : Bool
    unless year.divisible_by?(100)
      year.divisible_by?(4)
    else
      year.divisible_by?(400)
    end
  end
end

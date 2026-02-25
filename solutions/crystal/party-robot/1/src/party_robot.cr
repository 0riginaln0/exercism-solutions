class PartyRobot
  def self.welcome(name : String) : String
    "Welcome to my party, #{name}!"
  end

  def self.happy_birthday(name : String, age : Int) : String
    "Happy birthday #{name}! You are now #{age} years old!"
  end

  def self.assign_table(
    name : String,
    direction : String,
    table : Int,
    distance : Float64,
    neighbor : String,
  ) : String
    "#{self.welcome(name)}
You have been assigned to table #{table.to_s}. Your table is #{direction}, exactly #{distance.round(1).to_s} meters from here.
You will be sitting next to #{neighbor[0]}#{neighbor[-1]}."
  end
end

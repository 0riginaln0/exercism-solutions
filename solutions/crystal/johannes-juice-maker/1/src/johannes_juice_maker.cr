# To Do: Define the class JuiceMaker

class JuiceMaker
  def initialize(@fluid : UInt8)
    @running = false
  end

  def start
    @running = true
  end

  def running?
    @running
  end

  def add_fluid(fluid_to_add : UInt8)
    @fluid += fluid_to_add
  end

  def stop(minutes_run : UInt8)
    @running = false
    @fluid -= minutes_run * 5
  end

  def self.debug_light_on?
    true
  end
end

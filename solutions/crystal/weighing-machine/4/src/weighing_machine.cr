class WeighingMachine
  getter precision : UInt8
  setter metric : Bool
  property weight : Float32

  def initialize(@precision : UInt8, @metric : Bool)
    @weight = 0.0
  end

  def weigh : String
    weight = @metric ? @weight : @weight * 2.20462
    weight = weight.round(@precision)
    weight.to_s
  end
end

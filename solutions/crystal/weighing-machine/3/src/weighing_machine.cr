class WeighingMachine
  getter precision
  setter metric
  property weight

  def initialize(@precision : UInt8, @metric : Bool)
    @weight = 0.0
  end

  def weigh : String
    weight = @metric ? @weight : @weight * 2.20462
    weight = weight.round(@precision)
    weight.to_s
  end
end

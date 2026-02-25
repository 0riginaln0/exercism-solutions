class WeighingMachine
  def initialize(@precision : UInt8, @metric : Bool)
    @weight = 0.0
  end

  getter :precision
  property :weight
  setter :metric

  def weigh : String
    weight = @metric ? @weight : @weight * 2.20462
    weight = weight.round(@precision)
    weight.to_s
  end
end

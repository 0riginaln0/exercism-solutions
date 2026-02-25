class Triangle
  alias Side = Int32 | Float64
  alias Sides = Tuple(Side, Side, Side)

  def initialize(@sides : Sides)
    raise ArgumentError.new if !valid?
  end

  def valid?
    @sides.max < @sides.sum / 2
  end

  def different_lengths
    @sides.to_set.size
  end

  def equilateral?
    different_lengths == 1
  end

  def isosceles?
    different_lengths < 3
  end

  def scalene?
    different_lengths == 3
  end
end

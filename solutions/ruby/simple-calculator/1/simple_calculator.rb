class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end
  
  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.is_a?(Numeric) and second_operand.is_a?(Numeric)
    
    result =
      case operation
      in "+"
        first_operand + second_operand
      in "/"
        return "Division by zero is not allowed." if second_operand == 0
        first_operand / second_operand
      in "*"
        first_operand * second_operand
      else
        raise UnsupportedOperation
      end
    
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end

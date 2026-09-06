class LogLineParser
  def initialize(line)
    @line = line
    @error, @message = @line.split(":")
    @message.strip!
    @error.strip!
    @error.slice!(0)
    @error.slice!(-1)
    @error.downcase!
  end

  def message
    @message
  end

  def log_level
    @error
  end

  def reformat
    "#{@message} (#{@error})"
  end
end
